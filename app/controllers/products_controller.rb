class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    add_breadcrumb "index", products_path
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    add_breadcrumb "prods home", products_path
    add_breadcrumb "prod view", product_path(@product.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
end