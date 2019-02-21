class Restaurant < ApplicationRecord
  # Class for restaurant
  # Each restaurant has name and address.
  # Each restaurant has working hours.
  # An opening hour has to be at least for an hour to midnight.
  # From closing and opening hour possible to get duration of work.
  # In database opening hour is stored in minutes from midnight.
  # And duration is stored in minutes.
  
  has_many :tables, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, presence: true

  validates :address, presence: true

  validates :open_hour, presence: true, numericality: { less_than: 1380 }

  validates :work_time, presence: true, numericality: { greater_than: 60, less_than: 1440 }


end
