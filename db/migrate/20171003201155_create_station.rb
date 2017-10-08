class CreateStation < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |s|
      
      s.text    :name
      s.integer :dock_count
      s.text    :city
      s.date    :installation_date
    
    end 
  end
end
