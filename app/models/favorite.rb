class Favorite < ApplicationRecord
  belongs_to :user
  validates :country, :recipe_link, :recipe_title, :user_id, presence: true
end
