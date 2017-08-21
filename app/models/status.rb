class Status < ActiveRecord::Base

  def self.convert_csv_to_status_attributes
    a = Time.now
    statuses = []
    CSV.foreach('db/csv/status_fixture.csv', {headers: true, header_converters: :symbol}) do |row|
      statuses << Status.new(
                              station_id:      row[:station_id],
                              bikes_available: row[:bikes_available],
                              docks_available: row[:docks_available],
                              time:            row[:time]
                              )
    end
  b = Time.now
  puts "Creating the status array took #{b - a} seconds"
  statuses
  end
end
