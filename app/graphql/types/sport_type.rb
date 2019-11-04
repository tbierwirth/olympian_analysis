module Types
  class SportType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    
    field :events, [EventType], null: false
  end
end
