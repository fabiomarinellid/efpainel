class Backoffice::Config::SiteController < ApplicationController
   before_action :set_site, only: [:edit, :update, :destroy]
   before_action :carregaDropdowns, only: [:index, :new , :create, :edit, :update]
   before_action :validaracesso, only: [:index, :new , :create, :edit, :update]

   layout "backoffice"
   before_action :authenticate_user!

  def index
    @sites = Site.where("name LIKE ?", "%#{params[:q]}%").page(params[:page]).per(5)
    @sitesCount = Site.where("name LIKE ?", "%#{params[:q]}%")
    @names_users = Site.names_users_from_site(current_user)
  end

  def new
    @site = Site.new
  end

  def create
    @site = SiteService.create(params_site, current_user.id)

    unless @site.errors.any?
      redirect_to edit_backoffice_config_user_path(current_user.id), notice: "Site cadastrado com sucesso, agora termine de cadastrar as informações do seu perfil"
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
      @profiles = Profile.profile_views(current_user, current_user.site)
    end

    def validaracesso
      unless(current_user.site.blank?)
        if(Profile.read_permit(3, current_user.id, current_user.site) == 0)
          redirect_to "/422.html"
        end
      end
    end

    def set_site
      @site = Site.find(params[:id])
    end

    def params_site
      params.require(:site).permit(:name, :description, :url, :user_ids)
    end

end
