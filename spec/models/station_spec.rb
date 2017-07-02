RSpec.describe Station do
   describe "Class Methods" do
     describe '.most_available_bikes' do
       it "returns the most bikes available at a station" do
         station_1 = Station.create(name: "First", dock_count: 4, city: "Detroit", installation_date: Time.now)
         station_2 = Station.create(name: "Second", dock_count: 2, city: "Detroit", installation_date: Time.now)
         station_3 = Station.create(name: "Third", dock_count: 23, city: "Detroit", installation_date: Time.now)
         station_4 = Station.create(name: "Fourth", dock_count: 6, city: "Detroit", installation_date: Time.now)
         station_5 = Station.create(name: "Fifth", dock_count: 5, city: "Detroit", installation_date: Time.now)

         result = Station.most_available_bikes

         expect(station_1.class).to eq(Station)
         expect(result).to eq(23)
       end
     end
   end

  describe "Validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 1, city: "Boston", installation_date: Time.now)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "California", city: "Boston", installation_date: Time.now)

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(dock_count: 1, name: "Boston", installation_date: Time.now)

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(dock_count: 1, city: "Boston", name: "California")

      expect(station).to_not be_valid
    end

    it "is valid with all attributes" do
     station = Station.new(name: "Gary", city:"Denver", dock_count: 2, installation_date: Time.now)

     expect(station).to be_valid
    end
  end

end
