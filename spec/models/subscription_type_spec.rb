require_relative '../spec_helper'

RSpec.describe SubscriptionType  do
  describe "attributes" do
    it "returns value in name column" do

      subscription = SubscriptionType.create(name: "Customer")
      expect(subscription.name).to eq("Customer")
    end
  end
end
