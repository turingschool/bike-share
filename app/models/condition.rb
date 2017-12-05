class Condition < ActiveRecord::Base
  has_many :trip_dates, :class_name => "Trip", :foreign_key => "start_date", :primary_key => "date"
end
