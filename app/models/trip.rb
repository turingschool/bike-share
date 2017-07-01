class Trip < ActiveRecord::Base
  validates_presence_of :duration
end
