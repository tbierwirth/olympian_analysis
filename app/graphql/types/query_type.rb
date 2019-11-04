module Types
  class QueryType < Types::BaseObject
    field :olympians, [Types::OlympianType], null: false do
      description "Return all olympians"
    end

    def olympians
      Olympian.all
    end

    field :youngest_olympian, Types::OlympianType, null: false do
      description "Return an olympian"
    end
    def youngest_olympian
      Olympian.order(:age).first
    end
  end
end
