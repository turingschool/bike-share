RSpec.describe Condition do
  describe "Validations" do
    it "is invalid without a date_id" do
      condition = Condition.create
    end
  end
end
