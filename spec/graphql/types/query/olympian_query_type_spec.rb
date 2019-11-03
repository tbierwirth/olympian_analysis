require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'users' do
    it "should return all olympians" do
      5.times do
        create(:olympian)
      end
      query = (
        %(query {
          olympians{
            id
            name
          }
          })
      )
      olympians = OlympianAnalysisSchema.execute(query).as_json['data']['olympians']
      expect(olympians.length).to eq(5)
    end
  end
end
