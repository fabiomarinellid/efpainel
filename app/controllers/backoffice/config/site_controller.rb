class Backoffice::Config::SiteController < ApplicationController
   before_action :set_site, only: [:edit, :update, :destroy]
   before_action :carregaDropdowns, only: [:index, :new , :create, :edit, :update]

   layout "backoffice"
   before_action :authenticate_user!

  def index
  	#@sites = Site.all.where(id: current_user.site_id)

  	@sites = Site.all
  end

  def new
    @site = Site.new
  end

  def create
    @site = SiteService.create(params_site)

    unless @site.errors.any?
      redirect_to backoffice_config_site_index_path, notice: "Novo site cadastrado com sucesso"
    else
      render :new
    end
  end

  def edit
     set_site
  end

  
  def update
    set_site
    if @site.update(params_site)
      redirect_to backoffice_config_site_index_path 
    else
      render :edit
    end
  end

  def destroy

    site_name = @site.name

    if @site.destroy
      redirect_to backoffice_config_site_index_path, notice: "Site #{site_name} excluido com sucesso"
    else
      render :index
    end
  end

 private

    def carregaDropdowns
      @admins = User.all   
    end

    def set_site
      @site = Site.find(params[:id])
    end

    def params_site
      params.require(:site).permit(:name, :description, :url)
    end

end
