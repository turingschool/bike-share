class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :doc_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true
end
