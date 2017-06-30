require 'csv'

def from_csv(file_path)
  values = []
  contents = CSV.open(file_path, headers: true, header_converters: :symbol)
  contents.each do |row|
    values << row.to_h
  end
  seed_database(values)
end

def seed_database(csv)

end
