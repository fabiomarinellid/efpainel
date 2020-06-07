class Backoffice::Config::SiteController < ApplicationController
   before_action :authenticate_user! 
   before_action :set_site, only: [:edit, :update, :destroy]
   before_action :carregaDropdowns, only: [:index, :new , :create, :edit, :update]

   layout "backoffice"
   

  def index
    unless(Profile.read_permit(3, current_user.id, current_user.site) == 0)
      @sites = Site.where("name LIKE ?", "%#{params[:q]}%").page(params[:page]).per(5)
      @sitesCount = Site.where("name LIKE ?", "%#{params[:q]}%")
      @names_users = Site.names_users_from_site(current_user)
    else
      redirect_to "/422.html"
    end
  end

  def new
    if(current_user.site.blank?)
      @site = Site.new
    else
      unless(Profile.create_permit(3, current_user.id, current_user.site) == 0) &&
        @site = Site.new
      else
        redirect_to "/422.html"
      end
    end
  end

  def create

    begin

      @site = SiteService.create(params_site, current_user.id)

      unless @site.errors.any?
        redirect_to edit_backoffice_config_user_path(current_user.id), 
        notice: "Site criado com sucesso, finalize seu perfil depois faça login novamente"
      else
        render :new
      end
      
    rescue StandardError => e

      render :new
      flash.now[:notice] = "Erro ao cadastrar site: #{e}"
      
    end

  end

  def edit
    unless(Profile.edit_permit(3, current_user.id, current_user.site) == 0)
     set_site
    else
      redirect_to "/422.html"
    end
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
    unless(Profile.erase_permit(3, current_user.id, current_user.site) == 0)
      site_name = @site.name

      if @site.destroy
        redirect_to backoffice_config_site_index_path, notice: "Site #{site_name} excluido com sucesso"
      else
        render :index
      end

    else
      redirect_to "/422.html"
    end
  end

 private

    def carregaDropdowns
      @admins = User.all 
      @profiles = Profile.profile_views(current_user, current_user.site)
    end

    def set_site
      @site = Site.find(params[:id])
    end

    def params_site
      params.require(:site).permit(:name, :description, :url, :user_ids)
    end

end
