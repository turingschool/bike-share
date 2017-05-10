class FixSpelling < ActiveRecord::Migration[5.0]
  def change
    rename_column :conditions, :percipitation, :precipitation
  end
end
