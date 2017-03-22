class Weather < ActiveRecord::Base

	validates :date, uniqueness: true

end