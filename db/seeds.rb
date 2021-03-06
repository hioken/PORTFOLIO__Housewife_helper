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
      password: 'password',
      cooking_time_limit: 120
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
  [104, 'ベーコン', 1, 1],
  [500, 'まぐろ', 2, 0],
  [501, '鮭', 2, 2],
  [502, 'スモークサーモン', 2, 2],
  [503, "鱈", 2, 0],
  [504, "タコ", 4, 1],
  [505, "イカ", 4, 1],
  [506, "ブリ", 4, 1],
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
  [1019, "大根", 3, 0],
  [3000, "卵", 4, 0],
  [3001, "しいたけ", 8, 0],
  [3002, "まいたけ", 8, 0],
  [3003, "えのき", 8, 0],
  [3004, "しめじ", 8, 0],
  [3005, "たけのこ", 1, 0],
  [5000, 'お米', 0, 0],
  [5001, 'おもち', 3, 0],
  [5002, 'パスタ', 1, 0],
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
  [5511, "しょうが", 9, 5],
  [5512, "ケチャップ", 9, 5],
  [5513, "マヨネーズ", 9, 5],
  [5514, "めんつゆ", 9, 5],
  [5515, "塩昆布", 9, 5],
  [5516, "白すりごま", 9, 5],
  [5517, "チーズ", 9, 5],
  [5518, "味噌", 9, 5],
  [5519, "酢", 9, 5],
  [5520, "バター", 9, 5],
  [5521, "カレー粉", 9, 5],
  [5522, "コンソメ", 9, 5],
  [5523, "小麦粉", 9, 5]
].each do |id, name, unit, html_color|
  Ingredient.create(id: id, name: name, unit: unit, html_color: html_color)
end

# FridgeItemのテストデータ
[
  [1, 100, 600],
  [1, 103, 800],
  [1, 104, 1000],
  [1, 503, 8],
  [1, 504, 6],
  [1, 1000, 8],
  [1, 1005, 10],
  [1, 1006, 800],
  [1, 1003, 8],
  [1, 1009, 14],
  [1, 1012, 400],
  [1, 1013, 16],
  [1, 1014, 10],
  [1, 3000, 24],
  [1, 3002, 4],
  [1, 5000, 120],
  [1, 5500, ApplicationRecord::BOOLEAN_AMOUNT],
  [1, 5501, ApplicationRecord::BOOLEAN_AMOUNT],
  [1, 5502, ApplicationRecord::BOOLEAN_AMOUNT],
  [1, 5504, ApplicationRecord::BOOLEAN_AMOUNT],
  [1, 5507, ApplicationRecord::BOOLEAN_AMOUNT],
  [1, 5508, ApplicationRecord::BOOLEAN_AMOUNT],
  [1, 5509, ApplicationRecord::BOOLEAN_AMOUNT],
  [1, 5510, ApplicationRecord::BOOLEAN_AMOUNT],
  [1, 5511, ApplicationRecord::BOOLEAN_AMOUNT]
].each do |user, ing, amo|
  FridgeItem.create(end_user_id: user, ingredient_id: ing, amount: amo)
end

[
  ['基本の肉じゃが', 40],
  ['チキンとキャベツのガーリック炒め', 40],
  ['やみつきチキン', 40],
  ['しめじとベーコンのワンパン和風パスタ', 40],
  ['フライパンでできるジューシーチャーシュー', 60],
  ['きゅうりの塩昆布おかか漬け', 20],
  ['ほうれん草のごま和え', 20],
  ['鶏のから揚げ', 90],
  ['とろーりチーズのえのきベーコン巻き', 20],
  ['アボカドとブロッコリーのゴロゴロたまごサラダ', 20],
  ['ふわとろ！親子丼', 40],
  ['白菜と豚バラの味噌煮込み', 40],
  ['鶏肉と玉ねぎの南蛮漬け', 60],
  ['ピリ辛鮭大根', 60],
  ['豚ロースとキャベツの甘辛みそ炒め', 40],
  ['鶏肉とタケノコの肉みそレタス', 40],
  ['野菜のペペロンチーノ', 40],
  ['和風ドレッシングのサラダ', 20],
  ['和風プルドポークライス', 60],
  ['チーズトマトかつ煮', 40],
  ['イカとブロッコリーのバター醤油炒め', 40],
  ['豚バラ肉の温かポトフ', 60],
  ['豚ナスとキャベツの味噌炒め', 40],
  ['ふわふわハンバーグ', 90],
  ['ナスのトマトソースグラタン', 120],
  ['鱈のムニエル', 40],
  ['ミートソーススパゲティ', 60],
  ['キャベツとサーモンのマリネ', 40],
  ['アボカドとタコのグリーンカレー', 90],
  ['ベーコンレタスチャーハン', 40],
  ['めんつゆで簡単 麻婆茄子', 30],
  ['ぱぱっと簡単！レタスチャーハン', 20],
  ['イカと大根の煮物', 20]
].each do |name, cooking_time|
  Recipe.create(name: name, cooking_time: cooking_time)
end
  
  
  
  
[
  [1, 100, 400],
  [1, 1001, 6],
  [1, 5504, 8, nil, 1],
  [1, 5505, 8, nil, 1],
  [1, 1, 1200],
  [2, 102, 600],
  [2, 5510, 4, 1, 0],
  [2, 5500, 4, 1, 4],
  [2, 1003, 1],
  [2, 5507, 1, nil, 6],
  [3, 102, 600],
  [3, 5512, 8, nil, 1],
  [3, 5502, 4, nil, 1],
  [3, 5504, 4, nil, 1],
  [3, 5510, 4, nil, 1],
  [3, 5513, 8, nil, 0],
  [4, 5002, 400],
  [4, 3004, 2],
  [4, 104, 200],
  [4, 5514, 200, nil, 2],
  [5, 101, 400],
  [5, 1016, 2, 1],
  [5, 5506, 4, 1, 1],
  [5, 1, 1600, 1],
  [5, 5504, 4, 2, 1],
  [6, 1005, 3],
  [6, 5507, 12, nil, 0],
  [6, 5515, 1, nil, 5],
  [7, 1006, 320],
  [7, 5500, 16, nil, 0],
  [7, 5505, 16, 1, 0],
  [7, 5504, 4, 1, 0],
  [8, 102, 600],
  [8, 5511, 8, nil, 0],
  [8, 5510, 8, nil, 0],
  [8, 5506, 8, nil, 1],
  [8, 5504, 8, nil, 1],
  [8, 5507, 1, nil, 6],
  [9, 104, 160],
  [9, 3003, 1],
  [9, 5517, 60, nil, 3],
  [10, 3000, 4],
  [10, 1015, 2],
  [10, 1013, 1],
  [10, 5053, 4, nil, 1],
  [10, 5508, 4, nil, 1],
  [11, 5000, 4],
  [11, 1009, 2],
  [11, 102, 400],
  [11, 5507, 4, nil, 1],
  [11, 5504, 4, 1, 1],
  [11, 5505, 4, 1, 1],
  [11, 5506, 4, 1, 1],
  [11, 5502, 4, 1, 1],
  [12, 1008, 1],
  [12, 101, 400],
  [12, 5504, 4, nil, 1],
  [12, 5506, 4, nil, 1],
  [12, 5509, 4, nil, 1],
  [12, 5518, 4, nil, 1],
  [13, 102, 400],
  [13, 1009, 1],
  [13, 5506, 4, nil, 0],
  [13, 5504, 4, nil, 1],
  [13, 5519, 100, nil, 2],
  [14, 501, 4],
  [14, 1019, 2],
  [14, 1, 1600],
  [14, 5502, 12, nil, 0],
  [14, 5504, 12, nil, 0],
  [14, 5506, 12, nil, 0],
  [14, 5510, 4, nil, 0],
  [14, 5511, 4, nil, 0],
  [14, 5520, 80, nil, 2],
  [15, 101, 320],
  [15, 1003, 1],
  [15, 5518, 8, 1, 1],
  [15, 5506, 8, 1, 1],
  [15, 5505, 8, 1, 0],
  [16, 102, 200],
  [16, 3005, 160],
  [16, 5511, 40, nil, 2],
  [16, 5502, 8, 1, 0],
  [16, 5518, 8, 1, 0],
  [16, 5507, 8, 1, 0],
  [16, 1004, 8, nil, 0],
  [17, 5002, 400],
  [17, 1003, 1],
  [17, 1013, 1],
  [17, 5514, 4, nil, 0],
  [17, 5508, 8, nil, 1],
  [18, 1004, 1],
  [18, 1005, 4],
  [18, 1009, 1],
  [18, 5508, 8, nil, 0],
  [18, 5504, 8, nil, 0],
  [19, 5000, 3],
  [19, 101, 600],
  [19, 1014, 4],
  [19, 5506, 200, 1, 2],
  [19, 5504, 8, 1, 1],
  [19, 5510, 4, 1, 0],
  [19, 5511, 2, 1, 0],
  [20, 102, 800],
  [20, 5500, 2, nil, 0],
  [20, 5507, 1, nil, 5],
  [20, 5510, 8, nil, 1],
  [20, 1014, 4],
  [20, 5517, 80, nil, 2],
  [20, 5508, 4, nil, 1],
  [21, 505, 8],
  [21, 1013, 1],
  [21, 5504, 4, nil, 0],
  [21, 5510, 4, nil, 0],
  [21, 5500, 1, nil, 5],
  [21, 5501, 1, nil, 5],
  [22, 101, 400],
  [22, 1001, 4],
  [22, 1009, 2],
  [22, 5510, 4, nil, 1],
  [22, 1, 1600],
  [22, 5522, 2, nil, 1],
  [23, 1003, 1],
  [23, 1002, 4],
  [23, 101, 200],
  [23, 5506, 2, nil, 1],
  [23, 5518, 2, nil, 1],
  [23, 5504, 4, nil, 0],
  [24, 103, 600],
  [24, 1009, 1],
  [24, 3000, 2],
  [24, 5500, 2, nil, 0],
  [24, 5501, 2, nil, 0],
  [25, 1002, 4],
  [25, 1014, 4],
  [25, 5500, 4, nil, 0],
  [25, 5517, 400, nil, 2],
  [26, 503, 4],
  [26, 5523, 1, nil, 6],
  [26, 5520, 1, nil, 6],
  [27, 5002, 400],
  [27, 5500, 4, nil, 0],
  [27, 103, 400],
  [27, 1009, 1],
  [27, 5512, 8, nil, 1],
  [27, 5510, 2, nil, 0],
  [28, 502, 16],
  [28, 1009, 1],
  [28, 1003, 1],
  [28, 5508, 4, nil, 1],
  [28, 5500, 4, nil, 0],
  [29, 504, 4],
  [29, 1015, 2],
  [29, 5521, 2, nil, 1],
  [29, 5508, 2, nil, 1],
  [29, 1, 1000],
  [30, 104, 200],
  [30, 1004, 1],
  [30, 5000, 2],
  [30, 3000, 4],
  [30, 5509, 8, nil, 0],
  [30, 5504, 8, nil, 0],
  [30, 5501, 4, nil, 0],
  [31, 103, 400],
  [31, 1002, 6],
  [31, 5510, 2, 1, 0],
  [31, 5518, 2, 1, 1],
  [31, 5514, 6, 2, 2],
  [31, 1, 600, 2, 2],
  [31, 5509, 2, 2, 1],
  [32, 5000, 4],
  [32, 104, 120],
  [32, 1004, 1],
  [32, 3000, 4, 0],
  [32, 5509, 2, 0, 1],
  [32, 5522, 2, nil, 1],
  [32, 5504, 2, nil, 0],
  [32, 5509, 2, nil, 1],
  [33, 505, 2],
  [33, 1019, 1],
  [33, 5506, 2, 1, 1],
  [33, 5505, 2, 1, 1],
  [33, 5504, 2, 1, 1]
].each do |recipe, ingredient, amount, mark, unit_2|
  RecipeIngredient.create(recipe_id: recipe, ingredient_id: ingredient, amount: amount, mark: mark, seasoning_unit: unit_2)
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
