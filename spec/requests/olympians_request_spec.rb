require 'rails_helper'

describe "Olympians" do
  it "returns all olympians in the database" do
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
    post "/graphql", params: { "query" => query }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    olympians = JSON.parse(response.body, symbolize_names: true)[:data][:olympians]

    expect(response).to be_successful
    expect(olympians.length).to eq(5)
  end
end
