class Api::ProductsController < ApplicationController
  
  def index
    @all_products = Product.all

    if params[:discount]
      @all_products = @all_products.where("price < ?", 3)
    end
    
    if params[:sort_order] == "desc"
      @all_products = @all_products.order(price: :desc)
    elsif params[:sort_order] == "asc"
      @all_products = @all_products.order(:price)
    end

    
    render "index.json.jb"
  end

  def show
    product = params[:id]
    @product = Product.find_by(id: product)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      render "show.json.jb"
    else
      render json: {message: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    product = params[:id]
    @product = Product.find_by(id: product)
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.inventory = params[:inventory] || @product.inventory
    @product.supplier_id = params[:supplier_id] || @product.supplier_id

    if @product.save
      render "show.json.jb"
    else
      render json: {message: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Your product was destroyed!"}
  end

end
