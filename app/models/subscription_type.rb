class SubscriptionType < ActiveRecord::Base
  has_many :trips


  def self.type_breakout
    # grouped = SubscriptionType.all.group_by(&:flavor)
    # total_count = SubscriptionType.count
    
    # total_count / grouped[1].count.to_f


    # SubscriptionType.group(:flavor).count

      group(:flavor).count
      # total = counts.values.reduce(:+)
      # counts.each do |flavor, count|
      #   puts "There are #{count} of #{flavor} (#{count * 100.0/total}%)"
      #  end

  end

end
