class OlympianEvent < ApplicationRecord
  belongs_to :olympian
  belongs_to :event

  validates_presence_of :olympian_id
  validates_presence_of :event_id
end
