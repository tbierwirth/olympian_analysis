module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :sport, SportType, null: false
  end
end
