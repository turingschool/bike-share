class Zipcode < ActiveRecord::Base
  validates_presence_of :zipcode

  def self.seed_by_zip(zip)
    find_or_create_by(zipcode: clean_zip(zip.to_s)).id
  end

  def self.clean_zip(zipcode)
    if zipcode.nil?
    "00000"
    elsif zipcode.length < 5
      zipcode.rjust(5,"0")
    elsif zipcode.length > 5
      zipcode[0..4]
    else
      zipcode
    end
  end
end
