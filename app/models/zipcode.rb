class Zipcode < ActiveRecord::Base
  belongs_to :trip


  validates :zip_code, presence: true, uniqueness: true
end
