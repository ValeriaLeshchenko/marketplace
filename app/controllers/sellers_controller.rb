class SellersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_seller.update(seller_params)
      redirect_to current_seller, :flash => {:notice => 'Profile updated!'}
    else
      redirect_to edit_seller_path(current_seller), :flash => {:alert => current_seller.errors }
    end

  end

  def seller_params
    params.require(:seller).permit(:email, :phone)
  end
end
