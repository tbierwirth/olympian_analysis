module Types
  class OlympianType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :sex, String, null: false
    field :age, Integer, null: false
    field :height, Integer, null: false
    field :weight, Integer, null: false

    field :team, String, null: false
    field :sport, String, null: false
    field :total_medals_won, Integer, null: false

    def team
      Team.find_by(id: object.team_id).name
    end

    def sport
      Sport.joins(events: [:olympian_events])
          .where('olympian_events.olympian_id = ?', object.id)
          .first.name
    end

    def total_medals_won
      OlympianEvent.where(olympian_id: object.id).count do |event|
        event.medal != "NA"
      end
    end
  end
end
