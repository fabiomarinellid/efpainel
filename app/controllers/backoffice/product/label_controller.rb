class Backoffice::Product::LabelController < ApplicationController
  before_action :set_label, only: [:edit, :update, :destroy]  
  before_action :carregaDropdowns, only: [:new , :create, :edit, :update]

  layout "backoffice"

  before_action :authenticate_user!
  def index

    Site.all.each do |site|

      if (request.subdomain == site.url) && (site.id == current_user.site_id)
        @labels = Label.all.where(site_id: current_user.site_id)
        return
      else
        @labels = Label.all.where(site_id: current_user.site_id)
        return
      end

    end
  end
  
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(params_label)
    if @label.save
      redirect_to backoffice_product_label_index_path, notice: "Rótulo #{@label.name} salvo com sucesso"
    else
      render :new
    end
  end


  def edit
  	 set_label
  end

  
  def update
  	set_label
    if @label.update(params_label)
      redirect_to backoffice_product_label_index_path, notice: "Rótulo #{@label.id} alterado com sucesso"
    else
      render :edit
    end
  end

  def destroy

    label_name = @label.name

    if @label.destroy
      redirect_to backoffice_product_label_index_path, notice: "Rótulo #{label_name} excluido com sucesso"
    else
      render :index
    end
  end

 private

    def carregaDropdowns
      @sites = Site.all   
    end

    def set_label
      @label = Label.find(params[:id])
    end

    def params_label
        params.require(:label).permit(:name, :description, :site_id, :color)
    end
end
