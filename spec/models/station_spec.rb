require "./spec/spec_helper"

RSpec.describe "A station is created" do
	it "it exists" do
    station = Station.new
    expect(station).to be_instance_of(Station)
  end

  # it "a station has a name" do
  #   station = Station.new(name: "Downtown")
  # end

  it "a station without a name is not saved in database" do
    time = DateTime.now
    station = Station.create(name: "Downtown", dock_count: 10, city_id: 1, installation_date: time)
    (Station.count).equal?(0)
  end

  it "a station without a dock_count is not saved in database" do
    time = DateTime.now
    quito = City.new(name: "Quito")
    station = Station.create(name: "Downtown", city_id: 1, installation_date: time)
    (Station.count).equal?(0)
  end

  it "a station without an installation_date is not saved in database" do
    station = Station.create(name: "Downtown", dock_count: 10, city_id: 1)
    (Station.count).equal?(0)
  end

  it "a station without a city_id is not saved in database" do
    time = DateTime.now
    station = Station.create(name: "Downtown", dock_count: 10, installation_date: time)
    (Station.count).equal?(0)
  end

  it "a created station is saved in database" do
    time = DateTime.now
    station = Station.create(name: "Downtown", dock_count: 10, city_id: 1, installation_date: time)
    expect(station).to be_instance_of(Station)
    (Station.count).equal?(1)
  end

  it "a more stations can be added" do
    time = DateTime.now
    Station.create(name: "Cloudbank", dock_count: 10, city_id: 1, installation_date: time)
    Station.create(name: "Bastion", dock_count: 1, city_id: 1, installation_date: time)
    Station.create(name: "Davison", dock_count: 20, city_id: 1, installation_date: time)
    Station.create(name: "Roundabout", dock_count: 10, city_id: 1, installation_date: (time - 10))

    (Station.count).equal?(6)
  end

  it "a station can show avg" do
    expect(Station.avg).to eq(10.2)
  end

  it "a station can show most_bikes" do
    expect(Station.most_bikes).to eq(20)
  end

  it "a station can show least_bikes" do
    expect(Station.least_bikes).to eq(1)
  end
  #
  # it "a station can show newest_station" do
  #   expect(Station.newest_station).to eq(Station.first)
  # end
  # #
  # it "a station can show oldest_station" do
  #   expect(Station.oldest_station).to eq(Station.last)
  # end

  # it "a station can show " do
  #   Station
  # end


end
