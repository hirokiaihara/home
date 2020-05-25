class Playcomment < ApplicationRecord
  validates :comment,  presence: true
  validates :comment,  length: {maximum: 60}
  belongs_to :play
  belongs_to :user
end
