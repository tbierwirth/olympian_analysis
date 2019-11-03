require 'rails_helper'

RSpec.describe OlympianEvent, type: :model do
  describe 'Relationships' do
    it { should belong_to :event }
    it { should belong_to :olympian }
  end
  describe 'Validations' do
    it { should validate_presence_of(:event_id) }
    it { should validate_presence_of(:olympian_id) }
  end
end
