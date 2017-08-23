describe Weather do
  describe "Validations" do

    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:max_temperature) }
    it { should validate_presence_of(:mean_temperature) }
    it { should validate_presence_of(:min_temperature) }
    it { should validate_presence_of(:mean_humidity) }
    it { should validate_presence_of(:mean_visibility) }
    it { should validate_presence_of(:mean_wind_speed) }
    it { should validate_presence_of(:precipitation) }
  end
  describe "Class Methods" do
    before(:each) do
      date1 = Date.new("8/29/2013")
      date2 = Date.new("7/12/2014")
      date3 = Date.new("6/23/2015")
      zip_code = 94107
      weather1 = Weather.new(date: date1,
                            max_temperature: 45.2,
                            mean_temperature: 55.2,
                            min_temperature: 23.4,
                            mean_humidity: 12.0,
                            mean_visibility: 13.0,
                            mean_wind_speed: 1.2,
                            precipitation: 0.6
                      )
      weather2 = Weather.new(date: date2,
                            max_temperature: 45.2,
                            mean_temperature: 55.2,
                            min_temperature: 23.4,
                            mean_humidity: 12.0,
                            mean_visibility: 13.0,
                            mean_wind_speed: 1.2,
                            precipitation: 0.5
                      )
      weather3 = Weather.new(date: date3,
                            max_temperature: 55.3,
                            mean_temperature: 55.2,
                            min_temperature: 23.4,
                            mean_humidity: 12.0,
                            mean_visibility: 6.7,
                            mean_wind_speed: 0.3,
                            precipitation: 0.0
                      )
    end

    it "can find

end
