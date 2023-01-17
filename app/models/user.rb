class User < ApplicationRecord
  # before_create :assign_api_key
  validates :name, :email, :api_key, presence: true
  validates_uniqueness_of :email, case_sensitive: false


end
