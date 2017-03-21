class SubscriptionType < ActiveRecord::Base
  has_many :trips


  def self.type_breakout
    grouped = SubscriptionType.all.group_by(&:flavor)
    total_count = SubscriptionType.count
    binding.pry
    total_count / grouped[1].count.to_f

  end

end
