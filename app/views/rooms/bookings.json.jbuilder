<% @roombookings.each do |roombooking| %>
{
    
      "title": "<%= @roombooking.id.to_json %>"
    
   
}
    <% end %>

