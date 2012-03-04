class Admin::ProductsController < ApplicationController

   before_filter :require_login

  # GET /products
  # GET /products.json
  def index
    add_breadcrumb "index", admin_products_path
    @products = Product.find_all_by_locale(I18n.locale)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def export
    render :upload_form
  end

  def xls_export
    uploaded_io = params[:xls]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end

    
    
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find_by_id_and_locale(params[:id], I18n.locale)

    add_breadcrumb "prods home", admin_products_path
    add_breadcrumb "prod view", admin_product_path(@product.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @url = admin_products_path
    @product = Product.new

    add_breadcrumb "prods home", admin_products_path
    add_breadcrumb "prod new", new_admin_product_path

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @url = admin_product_path
    @product = Product.find_by_id_and_locale(params[:id], I18n.locale)

    add_breadcrumb "prods home", admin_products_path
    add_breadcrumb "prod edit", edit_admin_product_path(@product.id)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    add_breadcrumb "prods home", admin_products_path

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product.id), notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find_by_id_and_locale(params[:id], I18n.locale)

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_product_path(@product.id), notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end
end
