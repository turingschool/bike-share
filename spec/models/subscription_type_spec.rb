require_relative '../spec_helper'

RSpec.describe SubscriptionType do
  describe "attributes" do
    it "should have a trips and subscription_type" do
      subscription = SubscriptionType.new(subscription_type: "Guest")
      expect(subscription).to respond_to(:subscription_type, :trips)
    end
  end

  describe "validations" do
    it "is invalid without a subscription type" do
      subscription = SubscriptionType.new

      expect(subscription).to_not be_valid
    end
  end
end