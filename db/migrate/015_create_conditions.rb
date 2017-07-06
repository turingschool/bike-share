class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.integer :date_id
      t.integer :max_temp
      t.integer :mean_temp
      t.integer :min_temp
      t.integer :mean_humidity
      t.integer :mean_visibility
      t.integer :mean_wind_speed
      t.integer :precipitation
    end
  end
end
