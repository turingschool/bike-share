class UpdateTripDatesFormat < ActiveRecord::Migration[5.0]
  def up
    change_table :trips do |t|
      t.change :start_date, :datetime
      t.change :end_date, :datetime
    end
  end

  def down
    change_table :trips do |t|
      t.change :start_date, :string
      t.change :end_date, :string
    end
  end
end
