require './spec/spec_helper'

RSpec.describe DateRef do
  describe "validations" do
    it "can make valid dates" do
      date = DateRef.new(date: "10-10-2010", name: "10-10-2010")

      expect(date).to be_valid
    end

    it "is invalid without date" do
      date = DateRef.new(name: "10-10-2010")

      expect(date).to_not be_valid
    end
  end

  describe 'date format is correct' do
    it "formats dates correctly" do
      date = DateRef.new(date: '01-24-2016', name: '01-24-2016')

      expect(date).to_not be_valid
    end
  end
end
