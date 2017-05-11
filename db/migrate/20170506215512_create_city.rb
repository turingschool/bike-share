class CreateCity < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.text :name, null: false
    end
  end
end
