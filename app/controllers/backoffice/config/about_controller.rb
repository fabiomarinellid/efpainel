class Backoffice::Config::AboutController < ApplicationController
  layout "backoffice"

   before_action :authenticate_user!
  def index
  	@abouts = About.all
  end

   def new
    @abouts = About.new
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

    def set_about
      @About = About.find(params[:id])
    end

    def params_about
        params.require(:about).permit(:description, :site_id)
    end
end
