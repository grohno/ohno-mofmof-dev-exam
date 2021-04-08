class Rental < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: proc {|attributes| attributes['route_name'].blank? and attributes['station_name'].blank? and attributes['walk_fraction'].blank?}, allow_destroy: true
  validates :rent_property_name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :building_age, presence: true
  validates :note, length: { in: 1..1000 }
end
