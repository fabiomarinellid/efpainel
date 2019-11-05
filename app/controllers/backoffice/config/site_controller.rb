class Backoffice::Config::SiteController < ApplicationController
   layout "backoffice"

   before_action :authenticate_user!
  def index
  	@sites = Site.all

  	@sites_site_logado = Site.all.where(id: current_user.site_id)
  end
end
