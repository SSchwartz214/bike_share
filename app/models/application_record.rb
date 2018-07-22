class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def parse_date_string(date_string)
    date_array = date_string.split('/')
    month = date_array[0].to_i
    day = date_array[1].to_i
    year = date_array[2].to_i

    {month: month, day: day, year: year}
  end
end
