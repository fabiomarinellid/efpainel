class Backoffice::Config::TitleController < ApplicationController

   layout "backoffice"

   before_action :authenticate_user!
  def index
  	@titulos = Title.all
  end

   def new
    @titulo = Title.new
  end

  def edit
  	 set_title
  end

  

  def update
  	set_title
    if @titulo.update(params_title)
      redirect_to backoffice_config_title_index_path 
    else
      render :edit
    end
  end

 private

    def set_title
      @titulo = Title.find(params[:id])
    end

    def params_title
        params.require(:title).permit(:title, :subtitle, :text, :bestsellername, :site_id, :principalbuttondescription, :photologo)
    end

end
