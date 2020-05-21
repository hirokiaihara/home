class Material < ApplicationRecord
  belongs_to :play, optional: true
end
