class Date < ActiveRecord::Base
  has_many :weathers
  has_many :startdates
  has_many :enddates
  has_many :trips, through: :startdates
  has_many :trips, through: :enddates
end
