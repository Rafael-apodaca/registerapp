class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart
    else
      render :new
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.cart_items.destroy_all
    redirect_to products_path, notice: 'Cart has been emptied.'
  end
  
  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
