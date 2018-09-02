json.array!(@roombookings) do |roombooking|
  json.extract! roombooking, :id, :description
  json.start roombooking.starttime
  json.end roombooking.endtime
  json.url roombooking_url(roombooking, format: :html)
end