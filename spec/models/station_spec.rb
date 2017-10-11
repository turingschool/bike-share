describe Station do
  describe "Validations" do
    it "is invalid without all attributes" do
      s1=Station.create(dock_count: 4, city: "Denver", installation_date: "Monday")
      s2=Station.create(name:"Union Station", city: "Denver", installation_date: "Monday")
      s3=Station.create(name:"Union Station", dock_count: 4, installation_date: "Monday")
      s4=Station.create(name:"Union Station", dock_count: 4, city: "Denver") 

      expect(s1).to_not be_valid
      expect(s2).to_not be_valid
      expect(s3).to_not be_valid
      expect(s4).to_not be_valid
    end 
  end 
end 
