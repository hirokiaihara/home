class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :message_text, presence: true, unless: :message_image?

  mount_uploader :message_image, ImageUploader
end