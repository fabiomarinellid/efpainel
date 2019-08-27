class Backoffice::Config::SiteController < ApplicationController
   layout "backoffice"

   before_action :authenticate_user!
  def index
  	@sites = Site.all
  end
end
