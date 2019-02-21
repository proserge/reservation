class Table < ApplicationRecord
  # Class for tables
  # Each table has own number which has to be unique for restaurant.
  # Each table has defined count of seats
  
  belongs_to :restaurant
  has_many :reservations
  has_many :users, through: :reservations

  validates :number, :seats_count, presence: true
  
  validates :number, numericality: { greater_than: 0 }
  validates_uniqueness_of :number, scope: :restaurant_id

  validates :seats_count, numericality: { greater_than: 0 }
end
