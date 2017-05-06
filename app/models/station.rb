class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :date_ref

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city_id, presence: true
  validates :date_ref_id, presence: true
end
