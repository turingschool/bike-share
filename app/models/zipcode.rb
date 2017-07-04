class Zipcode < ActiveRecord::Base
  validates_presence_of :zipcode

  def self.create_zipcode(instance)
    find_or_create_by(zipcode: instance.zipcode)
  end
  
end
