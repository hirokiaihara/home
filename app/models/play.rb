class Play < ApplicationRecord
  validates :play_title, :play_image, :play_introduction, :category, presence: true
  validates :play_title, length: {maximum: 20}
  validates :play_introduction, length: {maximum: 60}

  belongs_to :user
  has_many :materials, dependent: :destroy
  has_many :works,     dependent: :destroy
  has_many :playcomments,  dependent: :destroy

  accepts_nested_attributes_for :materials, allow_destroy: true
  accepts_nested_attributes_for :works, allow_destroy: true

  mount_uploader :play_image, ImageUploader
  

  def self.search(search)
    # return Play.all unless search
    # Play.joins(:materials).where('play_title LIKE(?) OR materials.material_name LIKE(?)', "%#{search}%", "%#{search}%")
    Playcategory.where('name LIKE(?)', "%#{search}%")
  end
end
