class Play < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :play_title, :play_image, :play_introduction, :playcategory_id, presence: true
  validates :play_title, length: {maximum: 20}
  validates :play_introduction, length: {maximum: 60}

  belongs_to :user
  has_many :materials, dependent: :destroy
  has_many :works,     dependent: :destroy

  accepts_nested_attributes_for :materials, allow_destroy: true
  accepts_nested_attributes_for :works, allow_destroy: true

  mount_uploader :play_image, ImageUploader
  
  belongs_to_active_hash :playcategory
end
