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
    array = string.split('')
    until array.count == 5
      array.unshift("0")
    end
    return array.join
  end
end
