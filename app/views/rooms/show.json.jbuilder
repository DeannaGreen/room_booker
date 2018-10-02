json.data do
  json.child! do
    json.extract! @room, :id, :roomname
    json.title @room.roomname
    json.url room_url(@room, format: :html)
    end
end
