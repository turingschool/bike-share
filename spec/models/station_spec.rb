require "./app/models/station"
require './spec/spec_helper'


dummy_data = {
  Station => {
    dock_count: 5,
    city: "San Francisco",
    name: "bike pile",
    installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'),
    lat: 37.332808,
    long: -121.883890
  }
  # Trip => {
  #
  # }
}

dummy_data.each do |model, data|
  describe model do

    before do
      @data = data.dup
    end

    it "is valid with all required properties" do
      record = model.new(@data)
      expect(record).to be_valid
    end

    context "is not not valid without property" do
      data.keys.each do |property|
        it(property) do
          @data.delete property
          record = model.new(@data)
          expect(record).to_not be_valid
        end
      end
    end
  end
end
