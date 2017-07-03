class CreateDates < ActiveRecord::Migration[5.0]
  def change
    create_table :dates do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
