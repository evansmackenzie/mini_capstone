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


end
