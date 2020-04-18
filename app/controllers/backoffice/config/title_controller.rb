class Backoffice::Config::TitleController < ApplicationController
   before_action :set_title, only: [:edit, :update]
   before_action :carregaDropdowns, only: [:index, :new , :create, :edit, :update]

   layout "backoffice"

   before_action :authenticate_user!
  def index

    Site.all.each do |site|

      if (request.subdomain == site.url) && (site.id == current_user.site)
        @titulos = Title.all.where(site_id: current_user.site)
        return
      else
        @titulos = Title.all.where(site_id: current_user.site)
        return
      end

    end
  	
  end

  def new
    @titulo = Title.new
  end

   def create
    @titulo = Title.new(params_title)
    if @titulo.save
      redirect_to backoffice_config_title_index_path, notice: "Titulos salvos com sucesso"
    else
      render :new
    end
  end

  def edit
  	 set_title
  end

  
  def update
  	set_title
    if @titulo.update(params_title)
      redirect_to backoffice_config_title_index_path, notice: "Titulos alterados com sucesso"
    else
      render :edit
    end
  end

 private

    def carregaDropdowns
      @sites = Site.all   
      @profiles = Profile.profile_views(current_user, current_user.site)
    end

    def set_title
      @titulo = Title.find(params[:id])
    end

    def params_title
        params.require(:title).permit(:title, :subtitle, :text, :bestsellername, :site_id, :principalbuttondescription, :photologo)
    end

end
