require 'faker'

COLORS = ['Mackerel', 'Herring', 'Sunrise', 'Blurple', 'Chart White', 'Olive White']

Product.delete_all
3.times do |i|
  item = Product.create(
    name: Faker::Commerce.product_name,
    price: rand(10).to_f,
    description: Faker::Lorem.paragraph,
    )

  COLORS.sample(3).each do |color|
    Color.create(
      color: color,
      product_id: item.id
      )
  end
end
