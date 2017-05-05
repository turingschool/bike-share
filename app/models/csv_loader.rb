require 'pry'
require 'csv'

class CSVLoader
  def self.parse_file(file_name)
    CSV.open file_name, headers:true, header_converters: :symbol
  end

  def populate
    
  end
end