class Lanchonetedotrom::HomeController < ApplicationController
  layout "lanchonetedotrom"

  parameter = require.query_parameters['site']
  site_id_parameter = parameter
  
  def index

  	if(site_id_parameter?)

  		@titulos = Title.all.where(site_id: site_id_parameter)
  	    @phones = Phone.all.where(site_id: site_id_parameter)
  	    @addresses = Address.all.where(site_id: site_id_parameter)
  		
  	else

  		@titulos = Title.all.where(site_id: Site.id.first)
  	    @phones = Phone.all.where(site_id: Site.id.first)
  	    @addresses = Address.all.where(site_id: Site.id.first)

  	end
  	
  
  end
end
