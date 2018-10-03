json.nextbooking do
  json.(@nextBooking, :id, :description)
end
unless currentbooking.nil?
  json.currentbooking do
    json.(@currentbooking, :id, :description)
  end
end 
