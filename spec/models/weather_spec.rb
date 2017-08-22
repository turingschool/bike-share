describe Weather do
  describe "Validations" do
    before { FactoryGirl.build_stub(:Weather) }

    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:max_temperature) }
    it { should validate_presence_of(:mean_temperature) }
    it { should validate_presence_of(:min_temperature) }
    it { should validate_presence_of(:mean_humidity) }
    it { should validate_presence_of(:mean_visibility) }
    it { should validate_presence_of(:mean_wind_speed) }
    it { should validate_presence_of(:precipitation) }
    it { should validate_presence_of(:zip_code) }
  end
  describe "Class Methods" do
    
  end
end
