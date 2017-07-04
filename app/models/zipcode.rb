class Zipcode < ActiveRecord::Base
  validates_presence_of :zipcode

  def self.create_zipcode(string)
    clean = clean_zipcode(string)
    find_or_create_by(zipcode: clean)
  end

  def self.clean_zipcode(string)
    if string == nil
      string = "00000"
    elsif string.length < 5
      return string.rjust(5, "0")
    elsif string.length > 5
      return string[0..4]
    else
      return string
    end
  end
end
