class Station < ActiveRecord::Base
  belongs_to :city
  validates :name,
            :latitude,
            :longitude,
            :dock_count,
            :installation_date,
            presence: true
end
