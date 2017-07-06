class CreateDatesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bike_share_dates do |t|
      t.integer :month
      t.integer :day
      t.integer :year
    end
  end
end
