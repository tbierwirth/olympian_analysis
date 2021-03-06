require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'Relationships' do
    it { should have_many :events }
  end
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
