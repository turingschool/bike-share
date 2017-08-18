class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :installation_date

  validates :name, presence: true
end