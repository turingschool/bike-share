class ChangeDateBackToDatetimeClass < ActiveRecord::Migration[5.0]
  def change
    def up
      change_table :trips do |t|
        t.change :start_date, :datetime
        t.change :end_date, :datetime
      end
    end

    def down
      change_table :trips do |t|
        t.change :start_date, :text
        t.change :end_date, :text
      end
    end
  end
end
