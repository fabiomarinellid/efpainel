class Backoffice::Contact::AddressController < ApplicationController
 before_action :set_address, only: [:edit, :update, :destroy]
 before_action :carregaDropdowns, only: [:new , :create, :edit, :update]

 layout "backoffice"

 before_action :authenticate_user!
  def index
  	@addresses = Address.all

    @address_site_logado = Address.all.where(site_id: current_user.site_id)
  end

 def new
    @address = Address.new
  end

  def create
    @address = Address.new(params_address)
    if @address.save
      redirect_to backoffice_contact_address_index_path, notice: "Endereço #{@address.street} salvo com sucesso"
    else
      render :new
    end
  end


  def edit
  	 set_address
  end

  
  def update
  	set_address
    if @address.update(params_address)
      redirect_to backoffice_contact_address_index_path, notice: "Endereço #{@address.id} alterado com sucesso"
    else
      render :edit
    end
  end

  def destroy

    address_name = @address.street

    if @address.destroy
      redirect_to backoffice_contact_address_index_path, notice: "Endereço #{address_name} excluido com sucesso"
    else
      render :index
    end
  end

 private

    def carregaDropdowns
      @sites = Site.all   
    end

    def set_address
      @address = Address.find(params[:id])
    end

    def params_address
        params.require(:address).permit(:street, :number, :neighborhood, :city, :state, :zipcode, :site_id)
    end
end
