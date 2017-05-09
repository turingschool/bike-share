require_relative '../spec_helper'

RSpec.describe SubscriptionType  do
  describe "attributes" do
    it "returns value in name column" do

      subscription = SubscriptionType.create(name: "Customer")
      expect(subscription.name).to eq("Customer")
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      subscription = SubscriptionType.create(name: nil)
      expect(subscription).to be_invalid
    end
  end

  describe "access to trips" do
    it "can access trip duration" do
      subscription = SubscriptionType.create(name: "Customer")
      subscription.trips.create(duration: 400,
                                start_station_id: 1,
                                end_station_id: 2,
                                start_date: ride_date,
                                end_date: ride_date,
                                bike_id: 122,
                                zip_code: 80218)
      expect(subscription.trips.first.duration).to eq(400)
    end
  end
end
