json.nextbooking do
  json.(@nextBooking, :id, :description  ,:user)
  json.starttime @nextBooking.starttime.strftime("%Y-%m-%d %H:%M")
  json.endtime @nextBooking.endtime.strftime("%Y-%m-%d %H:%M")
end
unless @currentBooking.nil?
  json.currentbooking do
    json.(@currentBooking, :id, :description, :user)
    json.starttime @currentBooking.starttime.strftime("%Y-%m-%d %H:%M")
    json.endtime @currentBooking.endtime.strftime("%Y-%m-%d %H:%M")
  end
end 
