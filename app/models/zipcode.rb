class Zipcode < ActiveRecord::Base
  validates_presence_of :zipcode

  def self.create_zipcode(string)
    clean = clean_zipcode(string)
    find_or_create_by(zipcode: clean)
  end

  def self.clean_zipcode(string)
    if string.length < 5
      return add_zeros(string)
    elsif string.length > 5
      return string[0..4]
    else
      return string
    end
  end

  def self.add_zeros(string)
    until string.length == 5
      string += "0"
    end
    return string
  end
end
