# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def random_reduce(data)
  while(data.count > 7500)
    data.delete(rand(data.count))
  end
end

def seed_data(path)
  raw_input = CSV.open(path, headers: true, header_converters: :symbol)
  binding.pry
  random_reduce(raw_input) if raw_input.count > 7500
  raw_input.each do |pre_hash|
    data = pre_hash.to_h
    # data_type.create(data)
  end
end

seed_data('./data/station.csv')
