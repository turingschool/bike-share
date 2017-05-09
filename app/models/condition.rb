class Condition < ActiveRecord::Base
  belongs_to :zipcode

  validates :date, presence:true

  def format_date
    date.strftime('%m/%d/%Y')
  end

  def zipcode_selected?(id)
    return "selected" if id == zipcode_id
    ""
  end
end
