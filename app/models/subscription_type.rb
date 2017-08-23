class SubscriptionType < ActiveRecord::Base
  has_many :trips

  def self.convert_csv_to_sub_types_attributes
    a = Time.now
    sub_types = []
    CSV.foreach("db/csv/trip_fixture.csv", {headers: true, header_converters: :symbol}) do |row|
      sub_types << SubscriptionType.new(subscription_type:   row[:subscription_type])
    end
    b = Time.now
    puts "Creating the subscription type array took #{b - a} seconds"
    trips
  end
end
