json.ignore_nil!
json.user do
  json.id @user.id
  json.name @user.name
  json.email @user.email
end
