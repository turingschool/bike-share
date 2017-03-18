class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true, uniqueness: true
  validates :dock_count, :installation_date, presence: true

end
