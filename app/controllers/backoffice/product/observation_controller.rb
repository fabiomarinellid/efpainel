class Backoffice::Product::ObservationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_observation, only: [:edit, :update, :destroy]  
  before_action :carregaDropdowns, only: [:index, :new , :create, :edit, :update]

  layout "backoffice"

  
  def index

     Site.all.each do |site|

      if (request.subdomain == site.url) && (site.id == current_user.site)
        @observations = Observation.all.where(site_id: current_user.site)
        return
      else
        @observations = Observation.all.where(site_id: current_user.site)
        return
      end

    end
  end
  
  def new
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(params_observation)
    if @observation.save
      redirect_to backoffice_product_observation_index_path, notice: "Observação n° #{@observation.id} salvo com sucesso"
    else
      render :new
    end
  end


  def edit
  	 set_observation
  end

  
  def update
  	set_observation
    if @observation.update(params_observation)
      redirect_to backoffice_product_observation_index_path, notice: "Observação n° #{@observation.id} alterado com sucesso"
    else
      render :edit
    end
  end

  def destroy

    observation_id = @observation.id

    if @observation.destroy
      redirect_to backoffice_product_observation_index_path, notice: "Observação n° #{@observation.id} excluido com sucesso"
    else
      render :index
    end
  end

 private

    def carregaDropdowns
      @sites = Site.all   
      @profiles = Profile.profile_views(current_user, current_user.site)
    end

    def set_observation
      @observation = Observation.find(params[:id])
    end

    def params_observation
        params.require(:observation).permit(:description,  :active, :site_id)
    end
end
