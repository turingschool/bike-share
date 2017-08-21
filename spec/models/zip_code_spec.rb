describe ZipCode do
  describe "validation" do
    it "zip code of 6 characters is invalid" do
      zip_code = ZipCode.create(zip_code: 4141444)

      expect(zip_code).to_not be_valid
    end
    it "zip code of 5 characters is valid" do
      zip_code = ZipCode.create(zip_code: 41414)

      expect(zip_code).to be_valid
    end
  end
end
