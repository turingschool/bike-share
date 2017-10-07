class Condition < ActiveRecord::Base
  validates :date, uniqueness: { scope: :zip_code }
end
