json.array!(@roombookings) do |roombooking|
  json.extract! roombooking, :id, :description
  json.resourceId roombooking.room_id
  json.start roombooking.starttime.strftime("%Y-%m-%d %H:%M")
  json.end roombooking.endtime.strftime("%Y-%m-%d %H:%M")
  json.title roombooking.description
  json.url roombooking_url(roombooking, format: :html)
end
