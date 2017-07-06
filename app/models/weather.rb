class Weather < ActiveRecord::Base
  belongs_to :bike_share_date, foreign_key: :date_id
  belongs_to :zip_code
end
