class Station < ActiveRecord::Base
  validates :name, :city, :dock_count, :installation_date, presence: true
end
