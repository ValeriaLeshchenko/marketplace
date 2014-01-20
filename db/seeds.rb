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

Seller.create({email: 'email@example.com',
                        password: 'password',
                        phone: '067 867 5747'})

products = Product.create([{name: 'Trousers', description: 'Checked men\'s trousers', company: 'Zara', count: 10,
                picture: File.open(File.join(Rails.root, 'public/trousers.jpeg')),
                           seller_id: 1},
                {name: 'Chiffon dance skirt', description: 'Very nice handmade four panel chiffon skirt
                with sequins', company: 'Atlanta belly dance', count: 4,
                picture: File.open(File.join(Rails.root, 'public/skirt.jpg')),
                                           seller_id: 1},
                {name: 'Trainers', description: 'Mizuno wave stylish trainers', company: 'Mizuno', count: 15,
                picture: File.open(File.join(Rails.root, 'public/shoes.jpg')),
                                           seller_id: 1}
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

tag_names = ["Ablaze", "Abrupt", "Accomplished", "Active", "Adored", "Adulated", "Adventurous", "Affectionate", "Amused", "Amusing", "Animal-like", "Antique", "Appreciated", "Archaic", "Ardent", "Arrogant", "Astonished", "Audacious", "Authoritative", "Awestruck", "Beaming", "Bewildered", "Bewitching", "Blissful", "Boisterous", "Booming", "Bouncy", "Breathtaking", "Bright", "Brilliant", "Bubbling", "Calm", "Calming", "Capricious", "Celestial", "Charming", "Cheerful", "Cherished", "Chiaroscuro", "Chilled", "Comical", "Commanding", "Companionable", "Confident", "Contentment", "Courage", "Crazy", "Creepy", "Dancing", "Dazzling", "Delicate", "Delightful", "Demented", "Desirable", "Determined", "Devoted", "Dominant", "Dramatic", "Drawn out", "Dripping", "Dumbstruck", "Ebullient", "Elated", "Elegant", "Enchanted", "Energetic", "Enthusiastic", "Ethereal", "Exaggerated", "Exalted", "Expectant", "Expressive", "Exuberant", "Faint", "Fantastical", "Favorable", "Febrile", "Feral", "Feverish", "Fiery", "Floating", "Flying", "Folksy", "Fond", "Forgiven", "Forgiving", "Freakin' awesome", "Frenetic", "Frenzied", "Friendly. amorous", "From a distance", "Frosted", "Funny", "Furry", "Galloping", "Gaping", "Gentle", "Giddy", "Glacial", "Gladness", "Gleaming", "Gleeful", "Gorgeous", "Graceful", "Grateful", "Halting", "Happy", "Haunting", "Heavenly", "Hidden", "High-spirited", "Honor", "Hopeful", "Hopping", "Humble", "Hushed", "Hypnotic", "Illuminated", "Immense", "Imperious", "Impudent", "In charge", "Inflated", "Innocent", "Inspired", "Intimate", "Intrepid", "Jagged", "Joking", "Joyful", "Jubilant", "Kindly", "Languid", "Larger than life", "Laughable", "Lickety-split", "Lighthearted", "Limping", "Linear", "Lively", "Lofty", "Love of", "Lovely", "Lulling", "Luminescent", "Lush", "Luxurious", "Magical", "Maniacal", "Manliness", "March-like", "Masterful", "Merciful", "Merry", "Mischievous", "Misty", "Modest", "Moonlit", "Mysterious", "Mystical", "Mythological", "Nebulous", "Nostalgic", "On fire", "Overstated", "Paganish", "Partying", "Perfunctory", "Perky", "Perplexed", "Persevering", "Pious", "Playful", "Pleasurable", "Poignant", "Portentous", "Posh", "Powerful", "Pretty", "Prickly", "Prideful", "Princesslike", "Proud", "Puzzled", "Queenly", "Questing", "Quiet", "Racy", "Ragged", "Regal", "Rejoicing", "Relaxed", "Reminiscent", "Repentant", "Reserved", "Resolute", "Ridiculous", "Ritualistic", "Robust", "Running", "Sarcastic", "Scampering", "Scoffing", "Scurrying", "Sensitive", "Serene", "Shaking", "Shining", "Silky", "Silly", "Simple", "Singing", "Skipping", "Smooth", "Sneaky", "Soaring", "Sophisticated", "Sparkling", "Spell-like", "Spherical", "Spidery", "Splashing", "Splendid", "Spooky", "Sprinting", "Starlit", "Starry", "Startling", "Successful", "Summery", "Surprised", "Sympathetic", "Tapping", "Teasing", "Tender", "Thoughtful", "Thrilling", "Tingling", "Tinkling", "Tongue-in-cheek", "Totemic", "Touching", "Tranquil", "Treasured", "Trembling", "Triumphant", "Twinkling", "Undulating", "Unruly", "Urgent", "Veiled", "Velvety", "Victorious", "Vigorous", "Virile", "Walking", "Wild", "Witty", "Wondering", "Zealous", "Zestful"]
tag_names.each do |n|
  Tag.create(name: n)
end

tags = Tag.all

products[0].tags << tags[2]
products[0].tags << tags[25]
products[1].tags << tags[40]
products[1].tags << tags[78]
products[1].tags << tags[95]
products[2].tags << tags[60]
products[2].tags << tags[234]
products[2].tags << tags[100]
products[2].tags << tags[48]
