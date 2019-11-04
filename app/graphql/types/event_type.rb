module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :sport, SportType, null: false
    field :medalists, [OlympianEventType], null: true

    def medalists
      OlympianEvent.where(event_id: object.id).where(medal: ['Bronze', 'Silver', 'Gold'])
    end
  end
end
