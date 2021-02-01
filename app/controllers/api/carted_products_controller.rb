class Api::CartedProductsController < ApplicationController

  before_action :authenticate_user

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
    )
    if @carted_product.save
      render "show.json.jb"
    else
      render json: {message: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")

    render "index.json.jb"
    
  end
end
