require 'csv'

datafile = Rails.root + 'db/data/activities.csv'

CSV.foreach(datafile, headers: true) do |row|
  binding.pry
  activity = Employee.find_or_create_by(name: row[0]
end
