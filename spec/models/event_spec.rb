require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Relationships' do
    it { should belong_to :sport }
  end
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
