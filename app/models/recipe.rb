class Recipe < ApplicationRecord
  # Setting
  has_many :recipe_ingredients, dependent: :destroy
  has_many :user_menus, dependent: :destroy
  
  # Methods
  def self.how_mach_already(recipe_ingredients, fridge_items, family_size)
    recipe_size = recipe_ingredients.size
    cover_cnt = 0
    recipe_ingredients.each do |id, amount| # 冷蔵庫にある食材をレシピの材料と比較して、賄えていたらcover_cntを++
      cover_cnt += 1 if fridge_items[id] && fridge_items[id] - amount * family_size >= 0
    end
    ret = (cover_cnt * 100 / recipe_size)
    ret > 40 ? ret : false # 40%以上賄えるものはその割合、40未満はfalseを返す
  end
  
  def recipe_ingredients_hash(sarve = 1)
    self.recipe_ingredients.pluck(:ingredient_id, :amount).map { |id, a| [id, a * sarve] }.to_h
  end
end
