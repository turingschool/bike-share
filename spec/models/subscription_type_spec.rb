require_relative '../spec_helper'

RSpec.describe SubscriptionType do

  # refactor me!
  def format_date(date)
    fd = date.split(/[\/: ]/)
    Time.local(fd[2], fd[0], fd[1], fd[3], fd[4])
  end

  before :each do
    SubscriptionType.create(flavor: "Subscriber")
    SubscriptionType.create(flavor: "Subscriber")
    SubscriptionType.create(flavor: "Subscriber")
    SubscriptionType.create(flavor: "Customer")
    SubscriptionType.create(flavor: "Customer")
    Trip.create(duration: 39,
                 start_date: format_date("12/15/2013 14:54"),
                 start_station_id: 4,
                 end_date: format_date("12/15/2013 15:56"),
                 bike_id: 1,
                 end_station_id: 32,
                 subscription_type_id: 1
                 )
     Trip.create(duration: 45,
                 start_date: format_date("11/15/2013 14:54"),
                 start_station_id: 7,
                 end_date: format_date("11/15/2013 15:56"),
                 bike_id: 2,
                 end_station_id: 32,
                 subscription_type_id: 1
                 )
     Trip.create(duration: 45,
                 start_date: format_date("11/15/2013 14:54"),
                 start_station_id: 7,
                 end_date: format_date("11/15/2013 15:56"),
                 bike_id: 2,
                 end_station_id: 7,
                 subscription_type_id: 1
                 )
  end

  describe "itself" do
    it "does exist" do
      expect(SubscriptionType.create).to be_kind_of(SubscriptionType)
    end

    it "has trips" do
      expect(SubscriptionType.first.trips.first).to be_kind_of(Trip)
    end
  end

  describe "methods" do
    it "has subscription count" do
      expect(SubscriptionType.type_breakout).to eq(22)
    end
  end

end
