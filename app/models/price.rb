class Price < ActiveRecord::Base
  belongs_to :product

  validates_presence_of [:amount, :currency]
  validates_inclusion_of :currency, in: %w(RUB USD EUR)
  validates_format_of :amount, with: /\A\d*\.\d{2,}\z/

  def exchange(target_currency='USD')
    currencies = [currency, target_currency]
    rate = case currencies
             when ["RUB", "EUR"]
               0.02
             when ["EUR", "RUB"]
               45.58
             when ["RUB", "USD"]
               0.03
             when ["USD", "RUB"]
               33.56
             when ["EUR", "USD"]
               1.36
             when ["USD", "EUR"]
               0.74
             when ["RUB", "RUB"], ["USD", "USD"], ["EUR", "EUR"]
               1
           end

    #"#{target_currency} #{(amount * rate).round(2)}"
    sprintf('%.2f', amount * rate)
  end

  class << self
    def biggest(currency)
      big = []
      all.each {|price| big << price.exchange(currency)}
      big.sort.last
      #all.map(&:exchange).sort.last
    end
  end

end
