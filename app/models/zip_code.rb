class ZipCode < ActiveRecord::Base
  has_many :trips

  validates :zip_code, presence: true
end
