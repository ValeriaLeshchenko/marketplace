class Price < ActiveRecord::Base
  belongs_to :product
  #CURRENCIES = ['RUB', 'USD', 'EUR']
end
