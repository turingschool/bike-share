require_relative "../spec_helper"
RSpec.describe SubscriptionType do
  before :each do
    @subscription_type = SubscriptionType.create(subscription_type: "Subscription")
  end
  
  describe "validations" do
    it "is invalid without a subscription_type" do
      subscription_type = SubscriptionType.create

      expect(subscription_type).to_not be_valid
    end
    
    it "is valid with subscription type" do
      expect(@subscription_type).to be_valid
    end
  end
    
  describe "attributes" do
    it "should have subscription_type" do
      expect(@subscription_type).to respond_to(:subscription_type)
    end
  end
end