module Types
  class OlympianType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :sex, String, null: false
    field :age, Integer, null: false
    field :height, Integer, null: false
    field :weight, Integer, null: false
  end
end
