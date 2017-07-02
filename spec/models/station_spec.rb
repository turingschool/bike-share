RSpec.describe Station do
  describe "Class Methods" do
    it "finds average number of bikes rounded to whole number" do
      station = Station.create(name: "Gary", city:"Denver", dock_count: 2, installation_date: Time.now)
      station2 = Station.create(name: "Lex", city:"Chicago", dock_count: 6, installation_date: Time.now)
      station3 = Station.create(name: "Jim", city:"San Diego", dock_count: 8, installation_date: Time.now)
      station4 = Station.create(name: "Glop", city:"Seattle", dock_count: 2, installation_date: Time.now)

      average_bikes = Station.average_bikes_available_per_station

      expect(average_bikes.class).to eq(Fixnum)
      expect(average_bikes).to eq(5)
    end
    it "returns most recently made station" do
      station1 = Station.create(name: "Gary", city:"Denver", dock_count: 2, installation_date: "8/12/2013")
      station2 = Station.create(name: "Lex", city:"Chicago", dock_count: 6, installation_date: "8/6/2017")
      station3 = Station.create(name: "Jim", city:"San Diego", dock_count: 8, installation_date: "9/6/2013")

      station = Station.most_recently_installed

      expect(station.class).to eq(Station)
      expect(station).to eq(station2)
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
