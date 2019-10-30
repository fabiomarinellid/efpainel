class Backoffice::Config::TitleController < ApplicationController
   before_action :set_title, only: [:edit, :update]

   layout "backoffice"

   before_action :authenticate_user!
  def index
  	@titulos = Title.all
  end

  def new
    @titulo = Title.new
  end

   def create
    @titulo = User.new(params_title)
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

    def set_title
      @titulo = Title.find(params[:id])
    end

    def params_title
        params.require(:title).permit(:title, :subtitle, :text, :bestsellername, :site_id, :principalbuttondescription, :photologo)
    end

end
