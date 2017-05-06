require 'csv'

CSV.foreach("db/csv/csv_data.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  User.create(row.to_hash)
end