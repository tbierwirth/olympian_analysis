module Types
  class AverageWeightType < Types::BaseObject
    field :unit, String, null: false
    field :male_olympians, Float, null: false
    field :female_olympians, Float, null: false

    def male_olympians
      Olympian.where(sex: "M").average(:weight).to_f.round(1)
    end

    def female_olympians
      Olympian.where(sex: "F").average(:weight).to_f.round(1)
    end
  end
end
