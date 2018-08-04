class Roombooking < ApplicationRecord
  # Creates a method called room on the roombooking instance
  # This will search the Room table, it will return the record with an id that matches the room_id field
  belongs_to :room
end
