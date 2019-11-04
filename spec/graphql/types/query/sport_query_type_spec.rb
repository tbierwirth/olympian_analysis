require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'Sports' do
    it "should return all sports and associated events" do
      sport = create(:sport)
      10.times do
        create(:event, sport_id: sport.id)
      end
      query = (
        %(query {
          sports{
            name
            events{
              name
            }
          }
        })
      )
      sports = OlympianAnalysisSchema.execute(query).as_json['data']['sports']
      expect(sports.first['events'].length).to eq(10)
    end
  end
end
