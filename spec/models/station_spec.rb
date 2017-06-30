require 'Date'

RSpec.describe Station do
  describe "Validations" do

      it "is valid with name, dock count, city and installation date" do
      station = Station.new(name: "Penn Station", dock_count: 32, city: "New York", installation_date: 'Sat, 08 Jun 2013')

      expect(station).to be_valid
      end

      it "is invalid if missing name" do
        station = Station.new(dock_count: 32, city: "New York", installation_date: 'Sat, 08 Jun 2013')

        expect(station).to_not be_valid
      end

      it "is invalid if missing dock type" do
        station = Station.new(name: "Jane", city: "New York", installation_date: 'Sat, 08 Jun 2013')

        expect(station).to_not be_valid
      end

      it "is invalid if created with the same name" do
        station = Station.create(name: "Penn Station", dock_count: 32, city: "New York", installation_date: 'Sat, 08 Jun 2013')
        station2 = Station.create(name: "Penn Station", dock_count: 34, city: "Chicago", installation_date: 'Sat, 08 Jun 2013')

        expect(station2).to_not be_valid
      end



  end
end
