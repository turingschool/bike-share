require_relative '../spec_helper'

RSpec.describe CSVLoader do
  describe "parsing a csv file" do
    before(:each) do
      # dummy = CSVLoader.new
      @file = CSVLoader.parse_file('./db/csv/station.csv')
    end

    it 'returns csv object' do
      expect(@file).to be_instance_of(CSV)
    end

    it 'has a count of 70' do
      expect(@file.readlines.size).to eq(70)
    end
  end
end