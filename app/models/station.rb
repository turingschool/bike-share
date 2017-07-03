class Station < ActiveRecord::Base
  validates_presence_of :name, :dock_count, :city_id#, :installation_date uncomment this after seeding
  belongs_to :cities
end
