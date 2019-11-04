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

    it "should return the youngest olympian" do
      youngest = create(:olympian, age: 18)
      create(:olympian, age: 30)
      query = (
        %(query {
          youngestOlympian{
            id
          }
          })
      )
      olympian = OlympianAnalysisSchema.execute(query).as_json['data']['youngestOlympian']
      expect(olympian['id'].to_i).to eq(youngest.id)
    end

    it "should return the youngest olympian" do
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
      olympian = OlympianAnalysisSchema.execute(query).as_json['data']['oldestOlympian']
      expect(olympian['id'].to_i).to eq(oldest.id)
      expect(olympian['age'].to_i).to eq(oldest.age)
    end
  end
end
