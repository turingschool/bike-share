class AddLatAndLong < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :stations, :long, :decimal, {:precision=>10, :scale=>6}
  end
end
