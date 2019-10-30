class Backoffice::Product::ProductController < ApplicationController
  before_action :set_produto, only: [:edit, :update, :destroy]

  layout "backoffice"

  before_action :authenticate_user!
  def index
  	@produtos = Item.all
  end

  def new
    @produto = Item.new
  end

  def create
    @produto = Item.new(params_produto)
    if @produto.save
      redirect_to backoffice_product_product_index_path, notice: "Produto #{@produto.name} salvo com sucesso"
    else
      render :new
    end
  end


  def edit
  	 set_produto
  end

  
  def update
  	set_produto
    if @produto.update(params_produto)
      redirect_to backoffice_product_product_index_path, notice: "Produto #{@produto.id} alterado com sucesso"
    else
      render :edit
    end
  end

  def destroy

    produto_nome = @produto.name

    if @produto.destroy
      redirect_to backoffice_product_product_index_path, notice: "Produto #{produto_nome} excluido com sucesso"
    else
      render :index
    end
  end

 private

    def set_produto
      @produto = Item.find(params[:id])
    end

    def params_produto
        params.require(:item).permit(:name, :description, :price,  :active, :bestseller, :category_id, :label_id, :site_id)
    end
end
