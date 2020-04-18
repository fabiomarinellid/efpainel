class Backoffice::Contact::PhoneController < ApplicationController
 before_action :set_phone, only: [:edit, :update, :destroy]
 before_action :carregaDropdowns, only: [:index, :new , :create, :edit, :update]

 layout "backoffice"

 before_action :authenticate_user!
  def index

    Site.all.each do |site|

      if (request.subdomain == site.url) && (site.id == current_user.site)
        @phones = Phone.all.where(site_id: current_user.site)
        return
      else
        @phones = Phone.all.where(site_id: current_user.site)
        return
      end

    end
  end

  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(params_phone)
    if @phone.save
      redirect_to backoffice_contact_phone_index_path, notice: "Contato #{@phone.name} salvo com sucesso"
    else
      render :new
    end
  end


  def edit
  	 set_phone
  end

  
  def update
  	set_phone
    if @phone.update(params_phone)
      redirect_to backoffice_contact_phone_index_path, notice: "Contato #{@phone.id} alterado com sucesso"
    else
      render :edit
    end
  end

  def destroy

    phone_name = @phone.name

    if @phone.destroy
      redirect_to backoffice_contact_phone_index_path, notice: "Contato #{phone_name} excluido com sucesso"
    else
      render :index
    end
  end

 private

    def carregaDropdowns
      @sites = Site.all  
      @profiles = Profile.profile_views(current_user, current_user.site)
    end

    def set_phone
      @phone = Phone.find(params[:id])
    end

    def params_phone
        params.require(:phone).permit(:name, :phone, :site_id)
    end
end
