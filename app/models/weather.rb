class Weather < ActiveRecord::Base

  validates :date,
  :max_temperature, :mean_temperature,
  :min_temperature, :mean_humidity,
  :mean_visibility, :mean_wind_speed,
  :precipitation, :zip_code,
  presence: true

  # def find_thirty_conditions(start_index)
  #   find_range = (start_index...(start_index + 30)).to_a
  #   find(find_range)
  # end
  #
  # def self.reset_ids
  #   connection.reset_pk_sequence!('weathers')
  # end

  def sort_by_date
    order(:date_id)
  end
end
