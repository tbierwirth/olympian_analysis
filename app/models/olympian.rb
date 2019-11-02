class Olympian < ApplicationRecord
  belongs_to :team

  validates_presence_of :name, :sex, :age, :height, :weight
end
