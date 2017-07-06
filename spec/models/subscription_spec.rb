RSpec.describe Subscription do
  describe "Validations" do
    it "is invalid without a subscription type" do
      subscription = Subscription.create(subscription_type: nil)

      expect(subscription).to_not be_valid
    end
  end

  describe "Class methods" do
    before :each do
      @customer_1 = Subscription.create(subscription_type: "Customer")
      @customer_2 = Subscription.create(subscription_type: "Customer")
      @subscriber_1 = Subscription.create(subscription_type: "Subscriber")
      @subscriber_2 = Subscription.create(subscription_type: "Subscriber")
    end

    it "shows number of subscribers and customers" do

      subscribers = Subscription.number_of_subscribers
      customers = Subscription.number_of_customers

      expect(subscribers).to eq(2)
      expect(customers).to eq(2)
    end

    it "shows percentage of subscribers and customers" do

      subscribers = Subscription.percentage_of_subscribers
      customers = Subscription.percentage_of_customers

      expect(subscribers).to eq("50%")
      expect(customers).to eq("50%")
    end
  end
end
