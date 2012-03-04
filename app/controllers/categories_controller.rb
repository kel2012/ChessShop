class CategoriesController < ApplicationController

  include TheSortableTreeController::Rebuild

  def manage
    @pages = Category.nested_set.find_all_by_locale(I18n.locale)
    
    add_breadcrumb "categories", categories_path
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
    
    @category = Category.find_by_id_and_locale(params[:id], I18n.locale)

    add_breadcrumb "cats home", categories_path
    add_breadcrumb "cat view", category_path(@category.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end
end