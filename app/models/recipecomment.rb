class Recipecomment < ApplicationRecord
  validates :comment, presence: true
  validates :comment, length: {maximum: 60}
  belongs_to :recipe
  belongs_to :user
end