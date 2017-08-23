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
      date = Date.new("8/29/2013")
      zip_code = 94107
      weather = Weather.new(date: date,
                            max_temperature: 45.2,
                            mean_temperature: 55.4,
                            min_temperature: 23.4,
                            mean_humidity: 12.0,
                            mean_visibility: 22.5,
                            mean_wind_speed: 65.2,
                            precipitation: 43.2)
    end

end
