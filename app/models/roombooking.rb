class Roombooking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validate :cannot_overlap_another_roombooking

  def cannot_overlap_another_roombooking
  	range = Range.new starttime, endtime
  	overlaps = Roombooking.exclude_self(id).exclude_otherrooms(room_id).in_range(range)
  	overlap_error unless overlaps.empty?
  end

  scope :in_range, -> range {
  	where('(starttime BETWEEN ? AND ?)', range.first, range.last)
  }
  scope :exclude_self, -> id { where.not(id: id) }
  scope :exclude_otherrooms, -> room_id { where(room_id: room_id) }

  def overlap_error
  	errors.add(:overlap_error, 'There is already an event scheduled in this hour!')
  end

end
