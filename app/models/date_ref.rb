class DateRef < ActiveRecord::Base
  has_many :stations
  has_many :trips

  validates :date, presence: true

  def self.clean_date(date)
    date = date.split(' ')[0].split("/").map do |date|
      if date.length == 1
        "0"+date
      else
        date
      end
    end
    date[0], date[1], date[2] = date[2], date[0], date[1]
    date.join('-')
  end

  def year
    self.date.year
  end
  
  def month
    self.date.month
  end
  
  # def self.august
  #   where(month: 8)
  # end

  # def self.clean_datetime(date)
  #   date = date.split('T')[0]

  # end
end
