class Lanchonetedotrom::HomeController < ApplicationController
  layout "lanchonetedotrom"

  
  
  def index
  	@titulos = Title.all


  	@phones = Phone.all.where(current_user.site_id)

  end
end
