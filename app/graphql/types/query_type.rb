module Types
  class QueryType < Types::BaseObject
    field :olympians, [Types::OlympianType], null: false do
      description "Return all olympians"
    end

    def olympians
      Olympian.all
    end
    
  end
end
