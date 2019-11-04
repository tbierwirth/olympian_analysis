module Types
  class OlympianStatsType < Types::BaseObject
    field :total_competing_olympians, Integer, null: false
    field :average_age, Float, null: false
    field :average_weight, AverageWeightType, null: true

    def total_competing_olympians
      Olympian.count
    end

    def average_age
      Olympian.average(:age).to_f.round(1)
    end

    def average_weight
      {
        unit: "kg"
      }
    end
  end
end
