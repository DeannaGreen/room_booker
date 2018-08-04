class Room < ApplicationRecord
  # This creates a method on room called #roombookings
  # It checks the roombookings table for records with a room_id that matches the room instance
  # and returns them in an activerecord collection (basically a fancy array)
  has_many :roombookings
end
