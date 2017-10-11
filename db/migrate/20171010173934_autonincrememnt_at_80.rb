class AutonincrememntAt80 < ActiveRecord::Migration[5.1]
  def change
    execute "SELECT setval('stations_id_seq', 90)"
  end
end
