require 'csv'

task import: :environment do
  CSV.foreach('db/data/olympic_data_2016.csv', headers: true) do |row|
    Team.find_or_create_by(name: row.to_hash['Team'])
  end
end
