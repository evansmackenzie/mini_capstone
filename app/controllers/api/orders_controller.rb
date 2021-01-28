class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def create
    @product = Product.find(params[:product_id])
    @subtotal = @product.price * params[:quantity].to_i
    @tax = @subtotal * 0.09
    
    @order = Order.new(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id],
      subtotal: @subtotal,
      tax: @tax,
      total: @subtotal + @tax
    )

    if @order.save
      render "show.json.jb"
      # render json: { message: "Order created successfully" }, status: :created
    else
      render json: { errors: @order.errors.full_messages }, status: :bad_request
    end
  end

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
