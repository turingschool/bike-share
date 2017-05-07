class ChangeCityToCityId < ActiveRecord::Migration[5.0]
  def change
    change_table(:stations) do |t|
      t.column :date_id, :integer
      t.remove :install_date  
    end
  end
end
