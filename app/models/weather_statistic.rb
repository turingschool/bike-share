class WeatherStatistic < ActiveRecord::Base
  belongs_to :date_ref
  belongs_to :city

  def self.key_zip_to_city
    {
      '94107'=> 'San Francisco',
      '94063'=> 'Redwood City', 
      '94301'=> 'Palo Alto', 
      '94041'=> 'Mountain View', 
      '95113'=> 'San Jose'
    }
  end

end
