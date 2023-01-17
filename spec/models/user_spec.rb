require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do 
    it { should have_many :favorites }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :api_key }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
