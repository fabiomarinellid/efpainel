class Backoffice::DashboardController < ApplicationController
  layout "backoffice"

   before_action :authenticate_user!
  
  def index
  
	  #if current_user.role == 'full_access'
	  #  @admins_count = User.admins_count
	  #else
	    @admins_count = User.admins_count_for_site(current_user.site_id)
	  #end

	  #if current_user.role == 'full_access'
	  #  @products_count = Item.products_count
	  #else
	    @products_count = Item.products_count_for_site(current_user.site_id)
	  #end

  end

end
