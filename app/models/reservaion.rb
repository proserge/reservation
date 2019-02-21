class Reservaion < ApplicationRecord
  belongs_to :user
  belongs_to :table

  validates :number, numericality: { greater_than: 0 }
  validates_uniqueness_of :number, scope: :restaurant_id

  before_create: check_availability

  private

  def self.check_availability(reservation_date, reservation_duration)
    reservations = Reservaion.where('time=?', reservation_date)
    new_start  = reservation_date.seconds_since_midnight
    new_end = (reservation_date.seconds_since_midnight  + reservation_duration * 60)
    reservations.each do |res|
      res_start = (res.time.seconds_since_midnight
      res_end = (res.time + res.duration).seconds_since_midnight
      if (res_start >= new_start && res_start <= new_end || res_end >= new_start && res_end <= new_end 
        return false
      end
    end
    return true
  end
end
