class Olympian < ApplicationRecord
  belongs_to :team

  validates_presence_of :name, :sex, :age, :height, :weight
  validates_presence_of :team_id
end
