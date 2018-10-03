json.nextbooking do
  json.(@nextBooking, :id, :description)
end
unless @currentBooking.nil?
  json.currentbooking do
    json.(@currentBooking, :id, :description)
  end
end 
