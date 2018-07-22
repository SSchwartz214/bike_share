class Station < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :dock_count
  validates_presence_of :city
  validates_presence_of :installation_date
  after_create :store_date_attributes

  def to_param
    slug
  end

  def store_date_attributes
    date_hash = parse_date_string(installation_date)

    @installation_day = date_hash[:day]
    @installation_month = date_hash[:month]
    @installation_year = date_hash[:year]
  end

  def self.average_bikes
    average(:dock_count)
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.most_bikes_station
    find_by(dock_count: most_bikes)
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.fewest_bikes_station
    find_by(dock_count: fewest_bikes)
  end

  def self.newest
    newest_by_year = find_by(installation_year: maximum(:installation_year))
    newest_by_month = newest_by_year.find_by(installation_month: newest_by_year.maximum(:installation_month))
    newest_by_month.find_by(installation_day: newest_by_month.maximum(:installation_day))
  end
end
