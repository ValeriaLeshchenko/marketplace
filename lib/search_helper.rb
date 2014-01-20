module SearchHelper
  def calculate_price(currency, price)
    price_low = BigDecimal.new(price.split(' - ')[0])
    price_high = BigDecimal.new(price.split(' - ')[1])
    price = case currency
              when "USD"
                price_low.round(2).to_f..price_high.round(2).to_f
              when "RUB"
                (price_low * 0.03).round(2).to_f..(price_high * 0.03).round(2).to_f
              when "EUR"
                (price_low * 1.36).round(2).to_f..(price_high * 1.36).round(2).to_f
            end
  end
end