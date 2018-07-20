# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_data(path, data_type)
  raw_input = CSV.open(path, headers: true, header_converters: :symbol)
  raw_input.each do |pre_hash|
    data = pre_hash.to_h
    data_type.create(data)
  end
end
