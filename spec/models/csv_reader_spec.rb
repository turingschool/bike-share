require_relative '../spec_helper'

RSpec.describe CSVReader do
  describe "parsing a csv file" do
    before(:each) do
      @dummy = Object.new
      @dummy.extend(CSVReader)
    end

    it 'returns csv object' do
      file = @dummy.parse_file('./db/csv/station.csv')
      expect(file).to be_instance_of(CSV)
    end
  end
end