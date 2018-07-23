class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  validates_presence_of :dock_count
  validates_presence_of :city
  validates_presence_of :installation_date

  def to_param
    slug
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
    find_by(installation_date: maximum(:installation_date))
  end

  def self.oldest
    find_by(installation_date: minimum(:installation_date))
  end
end
