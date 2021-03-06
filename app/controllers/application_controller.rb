class ApplicationController < ActionController::Base
  before_action :authenticate_end_user!
  before_action :time_set
  before_action :check_untreated
  
  # 定数
  RETRY_COUNT = 3
  ERROR_MESSAGE = {
    unexpected: '予期せぬエラーが発生しました。早急に原因を調査して修正致しますので、時間をおいて再度ご利用ください。ご迷惑をおかけして申し訳ございません。',
    end_user_update: 'ユーザー情報の更新に失敗しました。アプリケーションの不具合により、現在そちらの設定に変更する事ができません、ご迷惑おかけいたします。',
    fridge_item_update: '食材の数量の更新に誤作動が生じたため、更新を取り消しました。',
    fridge_item_create: '食材の追加に失敗しました。',
    user_menu_update: '献立の追加/更新に失敗しました。',
    user_menu_cooked: '調理済み処理に失敗しました。'
  }
  
  # methods
  def after_sign_in_path_for(resource)
    if (date = Outline.find_by(user: current_end_user.id))
      date.destroy!
    end
    Outline.create(user: current_end_user.id, today: Date.today)
    time_set
    end_users_path
  end
  
  def time_set
    if end_user_signed_in?
      date = Outline.find_by(user: current_end_user.id)
      @set_today = (date ? date.today : Date.today)
    end
  end
  
  def check_untreated
    if end_user_signed_in?
      @unconfirmed = current_end_user.user_menus.eager_load(:recipe).where("is_cooked = ? AND cooking_date < ?", false, @set_today)
    else
      @unconfirmed = []
    end
  end
  
  def unknown_exception_rescue
    e = false
    retry_cnt = 0
    begin
      yield
    rescue => e
      retry_cnt += 1
      retry if retry_cnt <= RETRY_COUNT
      e.exception_log
      redirect_to exceptions_path
    end
    e
  end
  
  def active_record_exception_rescue(message, template = false, action: true)
    e = false
    retry_cnt = 0
    begin
      yield
    rescue => e
      if e.class.name.deconstantize == "ActiveRecord"
        e.exception_log
        flash.now[:exception_message] = message
        render template if template && (template.class != FalseClass || action)
      else
        retry_cnt += 1
        retry if retry_cnt <= RETRY_COUNT
        e.exception_log
        redirect_to exceptions_path if action
      end
      if !(action)
        flash.now[:exception_message] = nil
        flash[:exception_message] = message
      end
    end
    e
  end
end

# 例外処理用メソッド
module LogSecretary
  def exception_log(tracing: true)
    text = "\n"
    text << "\tError:    #{self.class}\n"
    text << "\tModel:    #{self.record.class}\n" if self.class.name.deconstantize == "ActiveRecord" && self.respond_to?(:record)
    text << "\tMassage:  #{self.message}\n"
      
    if tracing
      text << "\tBacktrace:\n"
      p self.class
      limit = ((self.class == ActiveRecord::RecordInvalid || self.class == ArgumentError) ? 16 : 30) # backtraceの出力行数
      cnt = 0
      self.backtrace.each do |trace|
        next unless trace.match?(/\/app\//)
        text << "\t\t" + trace + "\n"
        cnt += 1
        if cnt > limit
          cnt = "over #{limit}"
          text << "\t\t......\n"
          break
        end
      end
      text << "\ttrace_count: #{cnt.to_s}\n"
    else
      text << "\tBacktrace:  none\n"
    end
    Rails.application.config.exception_logger.info(text)
  end
end

module ActiveRecord
  include LogSecretary
end

class Exception
  include LogSecretary
end


# ruby組み込みclassに追加するメソッド
class Integer
  # 割り切れるか
  def divisible?(number)
    self % number == 0
  end
  
  #amountのユーザー向け表記を返す
  def regular_amount(unit)
    if unit == 'option' || unit == '合'
      ''
    elsif unit == 'g'
      (self / 4).to_s
    else
      result = self.divmod(4)
      if result[1] == 0
        result[0].to_s
      elsif result[1] == 2
        result[0] > 0 ? "#{result[0]}と1/2" : '1/2'
      else
        result[0] > 0 ? "#{result[0]}と#{result[1]}/4" : "#{result[1]}/4"
      end
    end
  end
  
  # form_select用の配列を返す
  def amount_select(unit)
    ret = []
    if unit != 'g'
      self.times do |amo|
        amo += 1
        ret <<
          if amo < 4
            ["#{amo} / 4" + unit, self - amo]
          elsif amo % 4 != 0
            ["#{amo / 4}と#{amo % 4} / 4 #{unit}", self - amo]
          else
            [(amo / 4).to_s + unit, self - amo]
          end
      end
    else
      (self / 200).times do |amo|
        amo += 1
        amo *= 200
        ret << [(amo / 4).to_s + unit, self - amo]
      end
      ret << ["#{(self / 4)}g", 0] if self / 200 == 0
    end
    ret
  end
end

class Hash
  def subtract!(rob, all_key_string: false)
    if all_key_string
      h_2 = self.map { |k, v| [k.to_s, v] }.to_h
      self.delete_if { |k, v| k.class != String }
      self.merge!(h_2)
      rob.each { |k, v| self[k.to_s] = self[k.to_s].to_i - v }
    else
      rob.each { |k, v| self[k] = self[k].to_i - v }
    end
  end
end

