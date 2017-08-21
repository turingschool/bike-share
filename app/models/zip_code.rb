class ZipCode < ActiveRecord::Base
  has_many :trips

  #add a validation to ensure the length is less than 6 characters.
end
