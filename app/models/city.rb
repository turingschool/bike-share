class City < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    has_many  :stations

  def self.duplicate(city)
    return city if !city.id.nil?
      city = all.find {|cities| cities.name == city.name}
    end
end
