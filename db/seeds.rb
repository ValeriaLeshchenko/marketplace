# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

colors = Color.create([{ name: 'red' },
                       { name: 'black' },
                       { name: 'purple' },
                       { name: 'pink' },
                       { name: 'blue' },
                       { name: 'green' },
                       { name: 'orange' },
                       { name: 'white' },
                       { name: 'yellow' },
                       { name: 'brown' },
                       { name: 'gray' }
])

sizes = Size.create([{ name: 'XS' },
                     { name: 'S' },
                     { name: 'M' },
                     { name: 'L' },
                     { name: 'XL' },
                     { name: 'XXL' },
                     { name: 'XXXL' }
])



products = Product.create([{name: 'Trousers', description: 'Checked men\'s trousers', company: 'Zara', count: 10,
                picture: File.open(File.join(Rails.root, 'public/trousers.jpeg'))},
                {name: 'Chiffon dance skirt', description: 'Very nice handmade four panel chiffon skirt
                with sequins', company: 'Atlanta belly dance', count: 4,
                picture: File.open(File.join(Rails.root, 'public/skirt.jpg'))},
                {name: 'Trainers', description: 'Mizuno wave stylish trainers', company: 'Mizuno', count: 15,
                picture: File.open(File.join(Rails.root, 'public/shoes.jpg'))}
])

prices = Price.create([{ amount: 5.23, currency: 'USD', product: products[0]},
                       { amount: 14.30, currency: 'RUB', product: products[1]},
                       { amount: 3.40, currency: 'EUR', product: products[2]}
])

products[0].colors << colors[0]
products[0].colors << colors[1]
products[1].colors << colors[3]
products[2].colors << colors[5]
products[2].colors << colors[7]
products[2].colors << colors[9]


products[0].sizes << sizes[2]
products[0].sizes << sizes[3]
products[0].sizes << sizes[4]
products[1].sizes << sizes[2]
products[2].sizes << sizes[5]
