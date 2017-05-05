require 'pry'
require 'csv'

module CSVReader
  def parse_file(file_name)
    CSV.open file_name, headers:true, header_converters: :symbol
  end
end