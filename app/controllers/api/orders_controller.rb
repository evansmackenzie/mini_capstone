class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def create
    carted_products = current_user.carted_products.where(status: "carted")
  
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end
  
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
      )
    if @order.save
      carted_products.update_all(status: "purchased", order_id: @order.id)
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #   @product = Product.find(params[:product_id])
  #   @subtotal = @product.price * params[:quantity].to_i
  #   @tax = @subtotal * 0.09
    
  #   @order = Order.new(
  #     user_id: current_user.id,
  #     quantity: params[:quantity],
  #     product_id: params[:product_id],
  #     subtotal: @subtotal,
  #     tax: @tax,
  #     total: @subtotal + @tax
  #   )

  #   if @order.save
  #     render "show.json.jb"
  #     # render json: { message: "Order created successfully" }, status: :created
  #   else
  #     render json: { errors: @order.errors.full_messages }, status: :bad_request
  #   end
  # end

  def index
    @all_orders = Order.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def show
    order = params[:id]
    @order = Order.find_by(id: order)
    render "show.json.jb"
  end

end
