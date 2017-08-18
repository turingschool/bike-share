RSpec.describe InstallationDate do
  describe "Validations" do
    it "is invalid without an installation date" do
      installation_date = InstallationDate.create

      expect(installation_date).to_not be_valid
    end
  end
end