
<table>


  <tbody>
    <% @roombookings.each do |roombooking| %>
      <tr>
        <td><%= roombooking.id %></td>
        <td><%= roombooking.room_id %></td>
        <td><%= roombooking.starttime %></td>
        <td><%= roombooking.endtime %></td>
        <td><%= link_to 'Show', roombooking %></td>
        <td><%= link_to 'Edit', edit_roombooking_path(roombooking) %></td>
        <td><%= link_to 'Destroy', roombooking, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

