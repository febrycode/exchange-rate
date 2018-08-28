class CreateDailyExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_exchange_rates do |t|
      t.references :exchange_code
      t.date :date_input
      t.decimal :rate_value, precision: 8, scale: 6

      t.timestamps
    end
  end
end
