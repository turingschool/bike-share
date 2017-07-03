class BikeShareDate < ActiveRecord::Base
  def format_date
    "#{month}-#{day}-#{year}"
  end
end
