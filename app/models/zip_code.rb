class ZipCode < ActiveRecord::Base
  has_many :trips

  validates :zip_code, length: { maximum: 5 }
end
