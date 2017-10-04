require "ActiveRecord"

class Station < ActiveRecord::Base

  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date,
                        :lat,
                        :long

end
