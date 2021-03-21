class EndUser < ApplicationRecord
  # setting
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :fridge_items, dependent: :destroy
  has_many :user_menus, dependent: :destroy
  
  # Methods
	def pick(genre_scope, *columns)
		constraint = {end_user_id: self.id}
		constraint[:ingredient_id] = self.class::GENRE_SCOPE[genre_scope] if self.class::GENRE_SCOPE[genre_scope]
		self.fridge_items.joins(:ingredient).where(constraint).pluck(*columns)
	end
	
	def need_ingredients(key: false)
	  needs = self.user_menus.joins(recipe: :recipe_ingredients).where(is_cooked: false, 'recipe_ingredients.ingredient_id': ApplicationRecord::GENRE_SCOPE[:semi_all]).pluck(:ingredient_id, :amount, :sarve)
	  ingredient_ids = []
	  needs.map! do |id, amount, sarve|
	    ingredient_ids << id
	    [id, amount * sarve]
	  end
	  return_list = {}
	  
	  if key == :name
	    name_list = Ingredient.where(id: ingredient_ids).pluck(:id, :name).to_h
	    needs.each do |need|
	      return_list[name_list[need[0]]] ? return_list[name_list[need[0]]] += need[1] : return_list[name_list[need[0]]] = need[1]
	    end
	  else 
	    needs.each do |need|
	      return_list[need[0]] ? return_list[need[0]] += need[1] : return_list[need[0]] = need[1]
	    end
	  end
	  
	  return_list
	end
	
	def lack_list(arg_ingredients = false, with_id: true)
		raise 'lack_list(models/end_user.rb)の引数がHash型ではありません' if arg_ingredients && arg_ingredients.class != Hash
	  needs = (arg_ingredients ? arg_ingredients.select { |id, amount| ApplicationRecord::GENRE_SCOPE[:semi_all].include?(id) } : self.need_ingredients)
	  fridge = self.fridge_hash(needs)
	  needs.merge!(fridge) { |id, a_1, a_2| a_1 - a_2 }
	  needs.delete_if { |id, a| a <= 0 }
	  if with_id
	    Ingredient.where(id: needs.keys).map { |ingre| [ingre.name, needs[ingre.id], ingre.unit, ingre.id] }
	  else
	    Ingredient.where(id: needs.keys).map { |ingre| [ingre.name, needs[ingre.id], ingre.unit] }
	  end
	end
	  
	def fridge_hash(arg_ingredients = false)
		ret = self.fridge_items.pluck(:ingredient_id, :amount).to_h
		ret.select{ |id, a| arg_ingredients.include?(id) } if arg_ingredients
  end
end
