class Rental < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true
  validates :rent_property_name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :building_age, presence: true
end
