class CreateRideDate < ActiveRecord::Migration[5.0]
  def change
    create_table :ride_dates do |t|
      t.integer :day
      t.integer :month
      t.integer :year

      t.timestamps null: false
    end 
  end
end
