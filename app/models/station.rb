class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, :dock_count, :installation_date, presence: true

end
