require 'date'
class Format
  def date(str)
    return DateTime.strptime(str)
  end
end
