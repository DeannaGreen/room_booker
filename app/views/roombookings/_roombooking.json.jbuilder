json.extract! roombooking, :id, :room_id, :starttime, :endtime, :created_at, :updated_at, :description, :user_id
json.url roombooking_url(roombooking, format: :json)
