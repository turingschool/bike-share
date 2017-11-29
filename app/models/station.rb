class Station < ActiveRecord::Base

  # validates :name, presence: true

  validates_presence_of :name, :dock_count, :city, :installation_date

end
