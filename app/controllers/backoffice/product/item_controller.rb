class Backoffice::Product::ItemController < ApplicationController
  
  #controller para corrigir conflito do update dos produtos e items

  layout "backoffice"

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

 
 private

    def set_produto
      @produto = Item.find(params[:id])
    end

    def params_produto
        params.require(:item).permit(:name, :description, :price,  :active, :bestseller, :category_id, :label_id, :site_id, :photoitem)
    end
end
