class DeleteMonthDayYearColumnsAddDateColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column(:bike_share_dates, :month)
    remove_column(:bike_share_dates, :day)
    remove_column(:bike_share_dates, :year)

    add_column(:bike_share_dates, :date, :date)
  end
end
