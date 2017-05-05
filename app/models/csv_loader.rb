require 'pry'
require 'csv'

class CSVLoader
  def parse_file(file_name)
    CSV.open file_name, headers:true, header_converters: :symbol
  end


end