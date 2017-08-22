class ChangeConditionsDateName < ActiveRecord::Migration[5.1]
  def change
    rename_column :conditions, :date, :condition_date
  end
end
