require_relative "../spec_helper"
RSpec.describe ZipCode do
  before :each do
    @zip_code = ZipCode.create(zip_code: 80602)
  end
  
  describe "validations" do
    it "is invalid without a zip_code number" do
      zip_code = ZipCode.create

      expect(zip_code).to_not be_valid
    end
    
    it "is valid with zip_code number" do
      expect(@zip_code).to be_valid
    end
  end
    
  describe "attributes" do
    it "should have zip_code number" do
      expect(@zip_code).to respond_to(:zip_code)
    end
  end
end