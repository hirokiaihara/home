# アプリ概要 *What's HOME?*
## お家時間を楽しみにする遊びとレシピと交流のプラットフォームアプリです
![top](https://user-images.githubusercontent.com/61179665/83653605-f473f780-a5f6-11ea-85fc-c5c98fa34837.jpg)
## 🌐 address 
### **http://www.your-home2020.com.** 
ログイン専用アカウントが埋め込んであります。
## 機能
- 遊びとレシピの記事投稿
- 投稿の検索
- 投稿の閲覧
- 投稿の編集・削除
- コメント機能
- ランキング機能
- マイフォルダ機能
- いいね機能(非同期）
- フォロー機能
- 通知機能
- グループ機能
- グループ内メッセージ（写真付き）機能
- ユーザー登録・編集・ログイン・ログアウト機能
- マイページ機能
## JavaScript
- スクロール検知
- フェードアニメーション
- 投稿前の画像プレビュー表示
- 入力欄の追加、削除
- メッセージ送信（非同期・自動更新）
- ユーザー・インクリメンタルサーチ
## 使用技術
### 言語・フレームワーク・ライブラリ
- Ruby on Rails
- HTML, CSS
- Java Script
- jQuery
### 環境
- インフラ
  - AWS EC2 Route53
  - Capistranoによる自動デプロイ
- サーバー
  - Unicorn
  - Nginx
- ストレージ
  - S3
### ツール
- GitHub （チーム開発を想定し、各タスクごとにブランチとプルリクエストを作成）
## このアプリを作成した理由 *Why?* 
#### **StayHomeを家族で楽しむ時間にする為**
家で過ごす時間が増えたので、その時間を創作や家族との食を育む時間に変えられたらいいなと思ったからです。
また、こんな時だからこそみんなで話したり共有することが大事と思いグループ機能を加えました。
## 遊びとレシピの検索と閲覧
<img width="500" alt="5aca7b44e631b25193494ce75a65a591" src="https://user-images.githubusercontent.com/61179665/83702483-cc60b480-a647-11ea-9886-d45f339547de.png">/
#### いいね！した記事はマイフォルダから閲覧出来ます。
## 遊びとレシピの記事投稿
<img width="500" alt="184e60ef356cf9c0d439330735c3b0c5" src="https://user-images.githubusercontent.com/61179665/83713643-96c9c480-a663-11ea-845a-abf83a516ea5.png">/
#### トップ画像と作り(遊び)方の画像はプレビュー表示してから投稿出来ます。入力欄は追加と削除が出来ます。
## グループ機能
<img width="500" alt="e1932cdaee3f52461b7c93516311a8aa" src="https://user-images.githubusercontent.com/61179665/83647677-1fa71880-a5f0-11ea-8541-ef6ec7b9ddc8.png">/
#### 写真付きでメッセージを共有します。（非同期・同時更新）
## Responsive Web Design
![shotsnapp-1591191448 422](https://user-images.githubusercontent.com/61179665/83644221-03a17800-a5ec-11ea-9dbb-40c3e6d14fbf.png)/
#### CSSはモバイルファーストで実装を進めました。

# データベース設計
<img width="900" alt="ER図" src="https://user-images.githubusercontent.com/61179665/83726959-48c2ba00-a67f-11ea-92c0-2649d1c17257.png">
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
- has_many :likes,      dependent: :destroy
- has_many :myrecipes,      dependent: :destroy
- has_many :group_users
- has_many :groups, through: :group_users
- has_many :messages,    dependent: :destroy
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user
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
- has_many :materials, dependent: :destroy
- has_many :works, dependent: :destroy
- has_many :playcomments, dependent: :destroy
- has_many :likes, dependent: :destroy
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
- has_many :foods, dependent: :destroy
- has_many :makes, dependent: :destroy
- has_many :recipecomments, dependent: :destroy
- has_many :myrecipes, dependent: :destroy
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
|created_user_id|integer|null: false|
### Association
- has_many :posts
- has_many :groups_users
- has_many :users,  through:  :groups_users

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message_text|text||
|message_image|string||
|group_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## likesテーブル
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
|play_id|integer||
|visiter_id|integer||
|visited_id|integer||
|playcomment_id|integer||
|recipecomment_id|integer||
|message_id|integer||
|group_id|integer||
|action|string||
|checked|boolean|default: false, null: false|
### Association
- belongs_to :play, optional: true
- belongs_to :recipe, optional: true
- belongs_to :playcomment, optional: true
- belongs_to :recipecomment, optional: true
- belongs_to :message, optional: true
- belongs_to :group, optional: true
- belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
- belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true



