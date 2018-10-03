json.nextbooking do
  json.(@nextBooking, :id, :description , :starttime , :endtime ,:user.email)
end
unless @currentBooking.nil?
  json.currentbooking do
    json.(@currentBooking, :id, :description, :starttime , :endtime,:user.email)
  end
end 
