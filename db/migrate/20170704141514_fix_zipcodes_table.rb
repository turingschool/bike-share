require_relative '20170703203738_create_zipcodes_table'

class FixZipcodesTable < ActiveRecord::Migration[5.0]
  def change
    revert CreateZipcodesTable

    create_table :zipcodes do |t|
      t.string :zipcodes
    end
  end
end
