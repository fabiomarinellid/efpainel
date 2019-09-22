class Lanchonetedotrom::HomeController < ApplicationController
  layout "lanchonetedotrom"

  
  
  def index
  	@titulos = Title.all
  end
end
