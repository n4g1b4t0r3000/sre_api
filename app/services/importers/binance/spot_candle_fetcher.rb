class Importers::Binance::SpotCandleFetcher < ApplicationService
  require 'httparty'

  def initialize(symbol:, interval:, start_time:)
    @symbol     = symbol
    @interval   = interval
    @start_time = start_time
  end

  def call
    import
  end

  private

  def import
    return save_candles if response.success?

    Rails.logger.error "Binance API Error: #{response.body}"
  end

  def save_candles
    response.parsed_response.each do |candle|
      open_time = Time.at(candle[0] / 1000)
      class_name.create!(
        open_time: open_time,
        open:      candle[1],
        high:      candle[2],
        low:       candle[3],
        close:     candle[4],
        volume:    candle[5],
        avg_price: (candle[1].to_f + candle[2].to_f + candle[3].to_f + candle[4].to_f) / 4.0
      )
    end
  end

  def response
    @response ||= HTTParty.get("#{ENV['BINANCE_ENDPOINT']}/klines", options)
  end

  def options
    {
      query: {
        symbol:    @symbol,
        interval:  @interval,
        startTime: @start_time.to_i * 1000
      }
    }
  end

  def class_name
    klass = "Spot#{@interval}Candle"

    begin
      Object.const_get(klass)
    rescue NameError
      Rails.logger.error "Class #{klass} does not exist."
    end
  end
end
