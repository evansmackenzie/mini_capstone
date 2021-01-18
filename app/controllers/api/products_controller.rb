class Api::ProductsController < ApplicationController
  
  def index
    @all_products = Product.all
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
    @product.save
    render "show.json.jb"
  end


end
