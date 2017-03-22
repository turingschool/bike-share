class ChangeFormatOfSubsriptionInput < ActiveRecord::Migration[5.0]
  def change
    change_column(:subscriptions, :subscription, :string)
  end
end
