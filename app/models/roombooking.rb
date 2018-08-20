class Roombooking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  #validates :roombooking, presence: true
end
