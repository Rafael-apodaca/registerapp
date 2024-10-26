class CartItemsController < ApplicationController
  def create
    @cart = Cart.find(params[:cart_id])
    @product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(product: @product)
    @cart_item.quantity ||= 0
    @cart_item.quantity += 1
    if @cart_item.save
      redirect_to @cart
    else
      render :new
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to @cart_item.cart
    else
      render :edit
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to @cart_item.cart
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
