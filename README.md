# データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|user_image|string||
|user_introduction|text||

### Association
- has_many :plays
- has_many :recipes
- has_many :playcomments
- has_many :recipecomments
- has_many :posts
- has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
- has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

## playsテーブル
|Column|Type|Options|
|------|----|-------|
|play_title|string|null: false|
|play_image|string|null: false|
|play_introduction|text|null: false|
|category|string|null: false|
|user_id|references|foreign_key: true|
### Association
- has_many :materials
- has_many :works
- has_many :playcomments
- belongs_to :user
- has_many :notifications, dependent: :destroy

## materials テーブル
|Column|Type|Options|
|------|----|-------|
|material_name|string||
|play_id|references|foreign_key: true|
### Association
- belongs_to :play

## Works テーブル
|Column|Type|Options|
|------|----|-------|
|work_image|string||
|work_text|text||
|play_id|references|foreign_key: true|
### Association
- belongs_to :play

## playcommentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|play_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

## recipesテーブル
|Column|Type|Options|
|------|----|-------|
|recipe_title|string|null: false|
|recipe_image|string|null: false|
|recipe_introduction|text|null: false|
|category|string|null: false|
|user_id|references|foreign_key: true|
### Association
- has_many :materials
- has_many :works
- has_many :recipecomments
- belongs_to :user
- has_many :notifications, dependent: :destroy

## foods テーブル
|Column|Type|Options|
|------|----|-------|
|food_name|string||
|quantity|string||
|recipe_id|references|foreign_key: true|
### Association
- belongs_to :recipe

## makes テーブル
|Column|Type|Options|
|------|----|-------|
|make_image|string||
|make_text|text||
|recipe_id|references|foreign_key: true|
### Association
- belongs_to :recipe

## recipecommentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|recipe_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|groupe_id|references|foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|
### Association
- has_many :posts
- has_many :groups_users
- has_many :users,  through:  :groups_users

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|message|text||
|post_image|string||
|group_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## myfavoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|play_id|references|foreign_key: true|
### Association
- belongs_to :play
- belongs_to :user

## myresipesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|recipe_id|references|foreign_key: true|
### Association
- belongs_to :recipe
- belongs_to :user

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|follow_id|references|foreign_key: { to_table: :users }|
### Association
- belongs_to :user
- belongs_to :folow

## notificationsテーブル
|Column|Type|Options|
|------|----|-------|
|play_id|references|foreign_key: true|
|visiter_id|integer||
|visited_id|integer||
|comment_id|integer||
|report_id|integer||
|action|string||
|checked|boolean|default: false, null: false|


