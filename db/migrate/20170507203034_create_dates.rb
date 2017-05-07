class CreateDates < ActiveRecord::Migration[5.0]
  def change
    create_table :dates do |t|
      t.integer :day
      t.integer :month
      t.integer :year
      t.datetime :date

      t.timestamps null: false
    end
  end
end
