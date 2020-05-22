class Make < ApplicationRecord
  belongs_to :recipe, optional: true
  validates  :make_text,   length: {maximum: 60}
  mount_uploader :make_image,   ImageUploader
end
