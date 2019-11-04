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

  it "should return the youngest olympian" do
    youngest = create(:olympian, age: 18)
    create(:olympian, age: 30)
    query = (
      %(query {
        youngestOlympian{
          id
          age
        }
        })
    )
    post "/graphql", params: { "query" => query }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    olympian = JSON.parse(response.body, symbolize_names: true)[:data][:youngestOlympian]

    expect(olympian[:id].to_i).to eq(youngest.id)
    expect(olympian[:age].to_i).to eq(youngest.age)
  end

  it "should return the oldest olympian" do
    create(:olympian, age: 18)
    oldest = create(:olympian, age: 30)
    query = (
      %(query {
        oldestOlympian{
          id
          age
        }
        })
    )
    post "/graphql", params: { "query" => query }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    olympian = JSON.parse(response.body, symbolize_names: true)[:data][:oldestOlympian]

    expect(olympian[:id].to_i).to eq(oldest.id)
    expect(olympian[:age].to_i).to eq(oldest.age)
  end
end
