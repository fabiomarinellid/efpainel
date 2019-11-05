class Backoffice::Config::AboutController < ApplicationController
  before_action :set_about, only: [:edit, :update, :destroy]
  before_action :carregaDropdowns, only: [:new , :create, :edit, :update]

  layout "backoffice"

  before_action :authenticate_user!
  def index
  	@abouts = About.all

    @abouts_site_logado = About.all.where(site_id: current_user.site_id)
  end

  def new
    @about = About.new
  end

  def create
    @about = About.new(params_about)
    if @about.save
      redirect_to backoffice_config_about_index_path
    else
      render :new
    end
  end

  def edit
     set_about
  end

  
  def update
    set_about
    if @about.update(params_about)
      redirect_to backoffice_config_about_index_path 
    else
      render :edit
    end
  end

 private

    def carregaDropdowns
      @sites = Site.all   
    end

    def set_about
      @about = About.find(params[:id])
    end

    def params_about
      params.require(:about).permit(:description, :site_id)
    end

end
