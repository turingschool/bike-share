require 'pry'
require 'csv'
require 'pry'

class CSVLoader
  def self.open(file_name)
    CSV.open file_name, headers:true, header_converters: :symbol
  end

  def to_array(file_name)
    csv = CSV::parse(File.open(file_name, 'r') {|f| f.read })
    fields = csv.shift
    fields = fields.map {|f| f.downcase.gsub(" ", "_")}
    csv.collect { |record| Hash[*fields.zip(record).flatten ] }
  end

  def find_records(contents, query)
    search_in = query[:search_in].to_sym
    search_for = query[:find]
    result = contents.select do |row|
      row[search_in] == search_for
    end
    result
  end
  # Might just need this method vvvvvv but saving ^ for later iterations
  def sanitize_station(path)
    data = CSV.open(path, headers: true, header_converters: :symbol)

    data.map do |row|
      # binding.pry
      {
        [:name] => row[:name],
        [:dock_count] => row[:dock_count].to_i,
        [:city] => row[:city],
        [:date] => row[:installation_date] # Should we make this an integer for calcs?
      }
    end
  end
end