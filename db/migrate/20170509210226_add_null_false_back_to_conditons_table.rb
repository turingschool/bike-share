class AddNullFalseBackToConditonsTable < ActiveRecord::Migration[5.0]
  def change
    change_column :conditions, :max_temp, :float, null: false
    change_column :conditions, :mean_temp, :float, null: false
    change_column :conditions, :min_temp, :float, null: false
    change_column :conditions, :mean_humidity, :float, null: false
    change_column :conditions, :mean_visibility, :float, null: false
    change_column :conditions, :mean_wind_speed, :float, null: false
    change_column :conditions, :precipitation, :float, null: false
  end
end
