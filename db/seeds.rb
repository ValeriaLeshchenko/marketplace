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
