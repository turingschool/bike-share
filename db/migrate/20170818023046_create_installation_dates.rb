class CreateInstallationDates < ActiveRecord::Migration[5.1]
  def change
    create_table :installation_dates do |t|
      t.date :installation_date
    end
  end
end
