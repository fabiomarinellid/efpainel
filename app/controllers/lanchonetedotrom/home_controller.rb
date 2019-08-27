class Lanchonetedotrom::HomeController < ApplicationController
  layout "lanchonetedotrom"

  
  
  def index
  	@titulos = Title.all.where(site: 2)
  end
end
