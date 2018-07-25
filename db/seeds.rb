# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'time'


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

# def cull_stupid_data(stupid_path, new_path)
#   return_value = ""
#   raw_input = File.open(stupid_path)
#   new_data = Hash.new([])
#   raw_input.each do |line|
#     zip = line[-6..-2]
#     new_data[zip] += [line]
#   end
#   first_line = new_data[new_data.keys.first]
#   final_zip = new_data[new_data.keys[rand(new_data.keys.length)]]
#   final_string = first_line.join + final_zip.join
#
#   File.write(new_path, final_string)
# end

Accessory.destroy_all

def to_date_time(date_string)
  unless date_string.nil?
    if date_string.length < 11
      Date.strptime(date_string, '%m/%d/%Y')
    else
      DateTime.strptime(date_string, '%m/%d/%Y %H:%M')
    end
  end
end

def seed_data(path, data_type)
  raw_input = CSV.open(path, headers: true, header_converters: :symbol)
  raw_input.each do |pre_hash|
    data = pre_hash.to_h
    changes = {}
    data.each_key do |key|
      if key.to_s.downcase.include?("date")
        changes[key] = to_date_time(data[key])
      end

      unless data_type.column_names.include?(key.to_s)
        data.delete(key)
        changes.delete(key)
      end
    end

    changes.each_key do |key|
      data[key] = changes[key]
    end
    data_type.create(data)
  end
end

# seed_data('./data/station.csv', Station)
# seed_data('./data/trip.csv', Trip)
# seed_data('./data/weather.csv', Condition)
seed_data('./data/accessory.csv', Accessory)
