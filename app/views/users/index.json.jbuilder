json.array!(@users) do |user|
  json.extract! user, :id, :email
  json.email user.email
  json.subdomain user.subdomain
  json.admin user.admin
  json.url user_url(user, format: :html)
end
