require 'rails_helper'

describe "Sports" do
  it "should returns all sports and their events in the database" do
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
    post "/graphql", params: { "query" => query }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    sports = JSON.parse(response.body, symbolize_names: true)[:data][:sports]

    expect(sports.first[:events].length).to eq(10)
  end
end
