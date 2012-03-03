class Admin::CategoriesController < ApplicationController

  include TheSortableTreeController::Rebuild

  before_filter :require_login
  #after_filter :store_location

  def manage
    @pages = Category.nested_set.all
    add_breadcrumb "cats home", admin_categories_path
    render :index
  end
  # GET /categories
  # GET /categories.json
  def index
    self.manage
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    
    @category = Category.find(params[:id])

    add_breadcrumb "cats home", admin_categories_path
    add_breadcrumb "cat view", admin_category_path(@category.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @url = admin_categories_path
    @category = Category.new

    add_breadcrumb "cats home", admin_categories_path
    add_breadcrumb "cat new", new_admin_category_path

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @url = admin_category_path
    @category = Category.find(params[:id])

    add_breadcrumb "cats home", admin_categories_path
    add_breadcrumb "edit", edit_admin_category_path(@category.id)
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    add_breadcrumb "cats home", admin_categories_path

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_path(@category.id), notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to admin_category_path(@category.id), notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_url }
      format.json { head :no_content }
    end
  end
end
