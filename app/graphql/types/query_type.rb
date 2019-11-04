module Types
  class QueryType < Types::BaseObject
    field :olympians, [Types::OlympianType], null: false do
      description "Return all olympians"
    end

    def olympians
      Olympian.all
    end

    field :youngest_olympian, Types::OlympianType, null: false do
      description "Return the youngest olympian"
    end

    def youngest_olympian
      Olympian.order(:age).first
    end

    field :oldest_olympian, Types::OlympianType, null: false do
      description "Return the oldest olympian"
    end

    def oldest_olympian
      Olympian.order(:age).last
    end

    field :olympian_stats, Types::OlympianStatsType, null: false do
      description "Return the average stats of olympians"
    end

    def olympian_stats
      {}
    end
  end
end
