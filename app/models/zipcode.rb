class Zipcode < ActiveRecord::Base
  validates_presence_of :zipcode

  #use this method for seed only?
  # def self.create_zipcode(instance)
  #   find_or_create_by(zipcode: instance.zipcode)
  # end

  def clean_zipcode(string)
    if string.length < 5
      return add_zeros(string)
    elsif string.length > 5
      return string[0..4]
    else
      return string
    end
  end

  def add_zeros(string)
    until string.length == 5
      string += "0"
    end
    return string
  end
end
