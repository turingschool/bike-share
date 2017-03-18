class Station < ActiveRecord::Base
	#belongs_to
	validates :name, presence: true #uniq?
	validates :dock_count, presence: true
	validates :city, presence: true
	validates :installation_date, presence: true

	# def self.all
	# end

end