json.nextbooking do
  json.(@nextBooking, :id, :description , :starttime.strftime('%I:%M%P') , :endtime.strftime('%I:%M%P') ,:user)
end
unless @currentBooking.nil?
  json.currentbooking do
    json.(@currentBooking, :id, :description, :starttime.strftime('%I:%M%P') , :endtime.strftime('%I:%M%P'),:user)
  end
end 
