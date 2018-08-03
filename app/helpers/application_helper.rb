module ApplicationHelper
  def convert_time(datetime)
    time = Time.parse(datetime).in_time_zone("Pacific Time (US & Canada)")
    time.strftime("%H:%M %Z")
  end
end
