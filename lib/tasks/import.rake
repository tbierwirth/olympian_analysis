require 'csv'

task import: :environment do
  CSV.foreach('db/data/olympic_data_2016.csv', headers: true) do |row|
    Team.find_or_create_by(name: row.to_hash['Team'])
    team = Team.find_by(name: row.to_hash['Team'])
    Olympian.find_or_create_by(
      name: row.to_hash['Name'],
      sex: row.to_hash['Sex'],
      age: row.to_hash['Age'],
      height: row.to_hash['Height'],
      weight: row.to_hash['Weight'],
      team_id: team.id,
    )
    Sport.find_or_create_by(name: row.to_hash['Sport'])
    sport = Sport.find_by(name: row.to_hash['Sport'])
    Event.find_or_create_by(
      name: row.to_hash['Event'],
      sport_id: sport.id
    )
  end
end
