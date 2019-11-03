require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'Relationships' do
    it { should have_many :olympians }
  end
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
