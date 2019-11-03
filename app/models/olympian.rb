class Olympian < ApplicationRecord
  belongs_to :team
  has_many :olympian_events
  has_many :events, through: :olympian_events

  validates_presence_of :name, :sex, :age, :height, :weight
  validates_presence_of :team_id
end
