json.array! @users do |user|
  json.id user.id
  json.nickname user.nickname
  json.user_image user.user_image_url
end