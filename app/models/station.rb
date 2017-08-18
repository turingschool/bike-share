class Station < ActiveRecord::Base
  validates :name, :dock_count, :city, :installation_date, presence: true



end
