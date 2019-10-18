class Backoffice::Product::CategoryController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]  

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
      redirect_to backoffice_product_category_index_path, notice: "Categoria #{@category.description} salva com sucesso"
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
      redirect_to backoffice_product_category_index_path, notice: "Categoria #{@category.id} alterada com sucesso"
    else
      render :edit
    end
  end

  def destroy

    category_description = @category.description

    if @category.destroy
      redirect_to backoffice_product_category_index_path, notice: "Categoria #{category_description} excluida com sucesso"
    else
      render :index
    end
  end

 private

    def set_category
      @category = Category.find(params[:id])
    end

    def params_category
        params.require(:category).permit(:description, :site_id)
    end
end
