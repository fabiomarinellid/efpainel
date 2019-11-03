class Lanchonetedotrom::HomeController < ApplicationController
  layout "lanchonetedotrom"

  
  
  def index
  	@titulos = Title.all.where(site_id: current_user.site_id)

  	

  	@phones = Phone.all.where(site_id: current_user.site_id)

  	@addresses = Address.all.where(site_id: current_user.site_id)
  end
end
