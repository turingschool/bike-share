class Trip < ActiveRecord::Base
    belongs_to :start_station, class_name: "Station"
    belongs_to :end_station,   class_name: "Station"

    validates_presence_of :duration,
                          :start_date,
                          :start_station,
                          :end_date,
                          :end_station,
                          :bike_id,
                          :subscription_type,
                          :zip_code

  def self.
  end



end

=begin

Create full CRUD functionality for a trip with the following characteristics:

* Duration - 
* Start Date
* Start Station
* End Date
* End Station
* Bike ID
* Subscription Type
* Zip Code

=end
