#ユーザーデータ
100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  postal_code = "3330034"
  address = "埼玉県川口市並木3丁目"
  phone_number = "0478888888"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               postal_code:        postal_code,
               address:                address,
               phone_number:      phone_number)
end

#商品データ
100.times do |n|
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

#タグデータ
Tag.create!(name: "すうじ")
Tag.create!(name: "図形")
Tag.create!(name: "算数")
Tag.create!(name: "地図・国旗")
Tag.create!(name: "ひらがな")
Tag.create!(name: "カタカナ")
Tag.create!(name: "漢字")
Tag.create!(name: "英語")
Tag.create!(name: "サポート機器")
Tag.create!(name: "親向け")
Tag.create!(name: "しつけ・教育")
Tag.create!(name: "6ヵ月から")
Tag.create!(name: "1歳から")
Tag.create!(name: "2歳から")
Tag.create!(name: "3歳から")
Tag.create!(name: "6歳から")
Tag.create!(name: "9歳から")
Tag.create!(name: "12歳から")
Tag.create!(name: "15歳以上")

# 商品とタグの関係データ
items = Item.all
item  = items.first
tags = Tag.all
tag = tags.first
following = tags[1..5]
followers = items[1..30]
following.each { |t| item.follow(t) } #2~6のタグにはid1の商品が紐づいている
followers.each { |i| i.follow(tag) } #id2~31の商品はid1のタグに紐づいている

# カートの商品データ
10.times do |n|
  cart_item_number  = n + 1
  user_id = n + 1
  item_id = n + 1
  CartItem.create!(cart_item_number: cart_item_number,
                   user_id:                   user_id,
                   item_id:                   item_id)
end
