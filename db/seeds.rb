
# EndUserのテストデータ
EndUser.create(
  [
    {
      email: 'a@a',
      password: 'password',
      cooking_time_limit: 120
    },
    {
      email: 'b@b',
      password: 'password'
    }
  ]
)

# Ingredientのテストデータ
[
  [1, '水', 0, 5],
  [100, '牛肉', 1, 1],
  [101, '豚肉', 1, 1],
  [102, '鶏肉', 1, 1],
  [103, 'ひき肉', 1, 1],
  [500, 'まぐろ', 2, 0],
  [501, '鮭', 2, 2],
  [502, 'スモークサーモン', 2, 2],
  [503, "鱈", 2, 0],
  [504, "タコ", 4, 1],
  [505, "カニ", 4, 1],
  [1000, "人参", 4, 2],
  [1001, "じゃがいも", 3, 0],
  [1002, "なす", 3, 5],
  [1003, "キャベツ", 3, 4],
  [1004, "レタス", 3, 4],
  [1005, "きゅうり", 4, 3],
  [1006, "ほうれん草", 1, 3],
  [1007, "ピーマン", 3, 3],
  [1008, "はくさい", 3, 4],
  [1009, "たまねぎ", 5, 0],
  [1010, "ねぎ", 4, 3],
  [1011, "れんこん", 3, 0],
  [1012, "もやし", 1, 0],
  [1013, "ブロッコリー", 3, 3],
  [1014, "トマト", 3, 1],
  [1015, "アボカド", 3, 4],
  [1016, "万能ねぎ", 8, 4],
  [1017, "オクラ", 3, 3],
  [1018, "かぼちゃ", 3, 4],
  [3000, "しめじ", 8, 0],
  [3001, "しいたけ", 8, 0],
  [3002, "まいたけ", 8, 0],
  [3003, "えのき", 8, 0],
  [5000, 'お米', 0, 0],
  [5001, 'うどん', 1, 0],
  [5500, "塩", 9, 5],
  [5501, "胡椒", 9, 5],
  [5502, "砂糖", 9, 5],
  [5503, "味の素", 9, 5],
  [5504, "醤油", 9, 5],
  [5505, "みりん", 9, 5],
  [5506, "酒", 9, 5],
  [5507, "サラダ油", 9, 5],
  [5508, "オリーブオイル", 9, 5],
  [5509, "ごま油", 9, 5],
  [5510, "ニンニク", 9, 5],
  [5511, "しょうが", 9, 5]
].each do |id, name, unit, html_color|
  Ingredient.create(id: id, name: name, unit: unit, html_color: html_color)
end

# FridgeItemのテストデータ
[
  [1, 100, 800],
  [1, 1000, 4],
  [1, 1003, 8],
  [1, 1009, 14],
  [1, 3000, 4],
  [1, 3002, 4],
  [1, 5000, 120],
  [1, 5500, 9999],
  [1, 5501, 9999],
  [1, 5502, 9999],
  [1, 5504, 9999],
  [1, 5507, 9999],
  [1, 5508, 9999],
  [1, 5509, 9999],
  [1, 5510, 9999],
  [1, 5511, 9999]
].each do |user, ing, amo|
  FridgeItem.create(end_user_id: user, ingredient_id: ing, amount: amo)
end


[
  ['肉じゃが', 30],
  ['チキン', 30],
].each do |name, cookent_time|
end
  
[
].each do |recipe, ingredient, amount|
end


=begin
# seedチェック

## FridgeItem
FridgeItem.all.each do |data|
  puts ("\n" + data.id.to_s)
  puts data.end_user.user_name
  puts data.ingredient.name
  puts "#{data.amount} #{data.ingredient.unit}"
end

user = EndUser.find(1)
user.fridge_items.joins(:ingredient).pluck(:amount, :name) do |data|
  p amount
  p name
end
=end
