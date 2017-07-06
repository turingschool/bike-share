class CreateBikedates < ActiveRecord::Migration[5.0]
  def change
    create_table :bike_dates do |t|
      t.datetime :date

      t.timestamps null: false
    end
  end
end
