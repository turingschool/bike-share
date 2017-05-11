class UpdateConditionZipcodeIdType < ActiveRecord::Migration[5.0]
  def change
    change_column :conditions, :zipcode_id, 'integer USING CAST(zipcode_id AS integer)'
  end
end
