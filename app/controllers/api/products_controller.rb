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

    # if params[:discount]
    #   @all_products = Product.where("price < ?", 3)
    # end

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
      image_url: params[:image_url]
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
    @product.image_url = params[:image_url] || @product.image_url

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
