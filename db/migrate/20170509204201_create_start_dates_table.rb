class CreateStartDatesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :start_dates do |t|
      t.integer :ride_date_id
    end
  end
end
