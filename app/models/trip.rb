require 'will_paginate'
require 'will_paginate/active_record'

class Trip <ActiveRecord::Base
validates_presence_of  :duration,
                       :start_date,
                       :start_station_name,
                       :end_date,
                       :end_station_name,
                       :bike_id,
                       :subscription_type
	self.per_page = 30
end 
