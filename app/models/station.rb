class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true

  # Station.find(params[:id]).update(params[:station])
  # city = City.find_by name: params[:city]["name"]
  # Station.find(params[:id]).update(city_id: city.id)
end
