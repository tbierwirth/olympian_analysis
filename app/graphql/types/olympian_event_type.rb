module Types
  class OlympianEventType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :team, String, null: false
    field :age, Integer, null: false
    field :medal, String, null: false

    def name
      object.olympian.name
    end

    def team
      object.olympian.team.name
    end

    def age
      object.olympian.age
    end

    def medal
      object.medal
    end
  end
end
