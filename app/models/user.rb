class User < ApplicationRecord
  validates :name, :email, :api_key,presence: true
  validates_uniqueness_of :email, case_sensitive: false
end
