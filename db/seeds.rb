require 'csv'

datafile = Rails.root + 'db/data/activities.csv'

CSV.foreach(datafile, headers: true) do |row|
  Activity.find_or_create_by(name: row["name"])
end
