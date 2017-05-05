class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :the_date
  validates :name, presence: true
  validates :dock_count, presence: true
end
