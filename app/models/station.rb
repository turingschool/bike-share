class Station < ActiveRecord::Base

  validates_presence_of :name, :city, :dock_count, :installation_date

end
