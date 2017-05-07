class ChangeDateToDateId < ActiveRecord::Migration[5.0]
  def change
    change_table(:stations) do |t|
      t.column :city_id, :integer
    end
  end  
end
