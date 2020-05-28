json.user_id @message.user_id
json.group_id @message.group_id
json.id @message.id
json.user_image @message.user.user_image_url
json.user_nickname @message.user.nickname
json.message_image @message.message_image_url
json.message_text @message.message_text
json.created_at @message.created_at.strftime("%m月%d日 %H時%M分")