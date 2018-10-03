json.nextbooking do
  json.(@nextBooking, :id, :description , :starttime , :endtime ,:user)
end
unless @currentBooking.nil?
  json.currentbooking do
    json.(@currentBooking, :id, :description, :starttime , :endtime,:user)
  end
end 
