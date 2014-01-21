class HomeController < ApplicationController
  before_filter :default_currency, only: :index


  def index
    if params[:query].present?
      colors = params[:query][:colors].nil? ? Color.pluck(:name) : params[:query][:colors]
      sizes = params[:query][:sizes].nil? ? Size.pluck(:name) : params[:query][:sizes]
      tags = params[:query][:tags].empty? ? Tag.pluck(:id) : params[:query][:tags].split(',')
      price = calculate_price(session[:currency], params[:query][:price])
      @products = Product.search '*', where: {color_name: colors,
                                              size_name: sizes,
                                              tag_id: tags,
                                              price_amount_usd: price}

    else
      @products = Product.search '*'
    end
  end


  def set_currency
    session[:currency] = params[:currency]
  end

  def default_currency
    session[:currency] ||= "USD"
  end

end
