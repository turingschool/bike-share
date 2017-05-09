class CreateEndDatesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :end_dates do |t|
      t.integer :ride_date_id
    end
  end
end
