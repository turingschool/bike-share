class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true, uniqueness: true
  validates :dock_count, presence: true
  # this will need to be addressed later:
  validates :city, presence: true
  validates :installation_date, presence: true
end
