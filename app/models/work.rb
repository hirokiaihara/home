class Work < ApplicationRecord
  belongs_to :play, optional: true
  validates  :work_text,   length: {maximum: 60}
  mount_uploader  :work_image,   ImageUploader
end
