require 'csv'

class CSVLoader
  def sanitize_station(path)
    data = CSV.open(path, headers: true, header_converters: :symbol)

    data.map do |row|
      # binding.pry
      {
        :id => row[:id],
        :name => row[:name],
        :dock_count => row[:dock_count].to_i,
        :city => row[:city],
        :date => row[:installation_date] # Should we make this an integer for calcs?
      }
    end
  end
end