class HomeController < ApplicationController
  before_filter :default_currency, only: :index


  def index
    #session[:currency] = 'USD'
    if params[:query].present?
      colors = params[:query][:colors].nil? ? Color.pluck(:name) : params[:query][:colors]
      sizes = params[:query][:sizes].nil? ? Size.pluck(:name) : params[:query][:sizes]
      price_low = BigDecimal.new(params[:query][:price].split(' - ')[0])
      price_high =  BigDecimal.new(params[:query][:price].split(' - ')[1])
      tags = params[:query][:tags].nil? ? Tag.pluck(:id) : params[:query][:tags]
      #if params[:query][:price].nil?
      #  price = Price.all.map(&:exchange)
      price = case session[:currency]
                  when "USD"
                    price_low.round(2).to_f..price_high.round(2).to_f
                  when "RUB"
                    (price_low * 0.03).round(2).to_f..(price_high * 0.03).round(2).to_f
                  when "EUR"
                    (price_low * 1.36).round(2).to_f..(price_high * 1.36).round(2).to_f
                end

      @products = Product.search '*', where: {color_name: colors,
                                              size_name: sizes,
                                              tag_id: tags,
                                              price_amount_usd: price}

    else
      @products = Product.all
    end
  end


  def set_currency
    session[:currency] = params[:currency]
    #respond_to do |format|
    #  format.js
    #  #format.html
    #end
  end

  def default_currency
    session[:currency] ||= "USD"
  end

end
