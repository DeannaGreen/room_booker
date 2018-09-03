json.array!(@roombookings) do |roombooking|
  json.extract! roombooking, :id, :description
  json.resourceId roombooking.room_id
  json.start roombooking.starttime
  json.end roombooking.endtime
  json.title roombooking.description
  json.url roombooking_url(roombooking, format: :html)
end
