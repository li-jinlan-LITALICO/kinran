Item.create!(name:                         "商品-0",
             picture:                  "商品-0.png",
             per_cost:                         2000,
             description: "1歳児向けのお絵かき玩具です。",
             stock_number:                      200)

99.times do |n|
  name  = "商品-#{n+1}"
  picture = name + ".png"
  per_cost = 1000 + n
  description = "1歳児向けのお絵かき玩具です。"
  stock_number = 100 + n
  Item.create!(name:                      name,
               picture:                picture,
               per_cost:              per_cost,
               description:        description,
               stock_number:      stock_number)
end
