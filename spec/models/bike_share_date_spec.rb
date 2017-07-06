RSpec.describe BikeShareDate do
  describe "Validations" do
    it "is invalid without a date" do
      date = BikeShareDate.new()

      expect(date).to_not be_valid
    end
  end

  describe "Class Methods" do
    describe '.create_by_date' do
      it "finds or creates a date and returns the id for year-date-month format" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
        date_3 = BikeShareDate.create(date: Date.strptime('2/21/2017', '%m/%d/%Y'))

        new_date_id = BikeShareDate.create_by_date('2011-01-24')
        new_date = BikeShareDate.find(new_date_id)

        expect(new_date_id).to eq(4)
        expect(new_date.date.month).to eq(1)
      end
    end

    describe '.seed_by_date' do
      it "finds or creates a date and returns the id for month/day/year format" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
        date_3 = BikeShareDate.create(date: Date.strptime('2/21/2017', '%m/%d/%Y'))

        new_date_id = BikeShareDate.seed_by_date('01/24/2011')
        new_date = BikeShareDate.find(new_date_id)

        expect(new_date_id).to eq(4)
        expect(new_date.date.month).to eq(1)
      end
    end
  end
end
