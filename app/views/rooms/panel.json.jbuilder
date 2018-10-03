json.nextbooking do
  json.(@nextBooking, :id, :description)
end
json.currentbooking do
  json.(@currentbooking, :id, :description)
end
