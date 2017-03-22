class SubscriptionType < ActiveRecord::Base
  has_many :trips


  def self.type_breakout
    grouped = SubscriptionType.all.group_by(&:flavor)
    total_count = SubscriptionType.count
    binding.pry
    total_count / grouped[1].count.to_f


SubscriptionType.group(:flavor).count


counts.each do |flavor, count|; puts "There are #{count} of #{flavor} (#{count * 100.0/total})"; end
  end

end
