class Backoffice::Product::CategoryController < ApplicationController
 
  layout "backoffice"

  before_action :authenticate_user!
  def index
 	@categories = Category.all
  end

  def new
    @category = Category.new
  end

   def create
    @category = Category.new(params_category)
    if @category.save
      redirect_to backoffice_product_category_index_path
    else
      render :new
    end
  end


  def edit
  	 set_category
  end

  
  def update
  	set_category
    if @category.update(params_category)
      redirect_to backoffice_product_category_index_path 
    else
      render :edit
    end
  end

 private

    def set_category
      @category = Title.find(params[:id])
    end

    def params_category
        params.require(:category).permit(:description, :site_id)
    end
end
