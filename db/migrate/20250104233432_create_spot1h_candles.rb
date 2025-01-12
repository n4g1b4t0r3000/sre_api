class CreateSpot1hCandles < ActiveRecord::Migration[7.2]
  def change
    create_table :spot1h_candles do |t|
      t.datetime :open_time
      t.decimal  :open,  precision: 15, scale: 8
      t.decimal  :high,  precision: 15, scale: 8
      t.decimal  :low,   precision: 15, scale: 8
      t.decimal  :close, precision: 15, scale: 8
      t.decimal  :volume, precision: 25, scale: 8
      t.decimal  :avg_price
      t.timestamps
    end
  end
end
