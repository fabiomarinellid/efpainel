class Backoffice::Product::ProductController < ApplicationController
  before_action :set_produto, only: [:edit, :update, :destroy]
  before_action :carregaDropdowns, only: [:index, :new , :create, :edit, :update]

  layout "backoffice"

  before_action :authenticate_user!
  def index

    Site.all.each do |site|

      if (request.subdomain == site.url) && (site.id == current_user.site)
        @produtos = Item.all.where(site_id: current_user.site)
        return
      else
        @produtos = Item.all.where(site_id: current_user.site)
        return
      end

    end
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

    def carregaDropdowns
      @profiles = Profile.profile_views(current_user, current_user.site)
      @categories = Category.all.where(site_id: current_user.site)   
      @labels = Label.all.where(site_id: current_user.site)
      @sites = Site.all   
    end

    def set_produto
      @produto = Item.find(params[:id])
    end

    def params_produto
        params.require(:item).permit(:name, :description, :price,  :active, :bestseller, :category_id, :label_id, :site_id)
    end
end
