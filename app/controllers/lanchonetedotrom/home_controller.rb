class Lanchonetedotrom::HomeController < ApplicationController
  layout "lanchonetedotrom"

  
  def index

    if params[:site].blank? 

    	session[:current_site_id] = Site.first

  		@titulos = Title.all.where(site_id: Site.first)
  	    @phones = Phone.all.where(site_id: Site.first)
  	    @addresses = Address.all.where(site_id: Site.first)
  		
  	else

        session[:current_site_id] = params[:site]

  	    @titulos = Title.all.where(site_id: params[:site])
  	    @phones = Phone.all.where(site_id: params[:site])
  	    @addresses = Address.all.where(site_id: params[:site])

  	end
  	
  
  end
end
