class AddTimestampsToStations < ActiveRecord::Migration[5.0]
  def change
    add_timestamps(:stations)
  end
end
