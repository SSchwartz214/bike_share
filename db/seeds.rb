# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


# def cull_data(path, new_path, cull_target)
#   raw_input = File.open(path)
#   new_data = []
#   raw_input.each do |line|
#     new_data.push(line)
#   end
#
#   while new_data.length > cull_target
#     index = rand(new_data.length - 1) + 1
#     new_data.delete_at(index)
#   end
#   File.write(new_path, new_data.join)
# end

def seed_data(path, data_type)
  raw_input = CSV.open(path, headers: true, header_converters: :symbol)
  raw_input.each do |pre_hash|
    data = pre_hash.to_h
    data.each_key do |key|
      unless data_type.column_names.include?(key.to_s)
        data.delete(key)
      end
    end
    data_type.create(data)
  end
end

seed_data('./data/station.csv', Station)
seed_data('./data/trip.csv', Trip)
seed_data('./data/weather.csv', Condition)
