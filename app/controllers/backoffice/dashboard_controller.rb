class Backoffice::DashboardController < ApplicationController
   layout "backoffice"

   before_action :authenticate_user!
   protect_from_forgery with: :exception
  
  def index

	# Caso esteja cadastrando um novo site
	 if(current_user.site.blank?)
		
		redirect_to new_backoffice_config_site_path, 
		notice: "Email e senha cadastrado com sucesso, agora cadastre o nome, uma descrição e o subdominio para seu novo site!"

	 end
  
	  #if current_user.role == 'full_access'
	  #  @admins_count = User.admins_count
	  #else
	    @admins_count = User.admins_count_for_site(current_user.site)
	  #end

	  #if current_user.role == 'full_access'
	  #  @products_count = Item.products_count
	  #else
	    @products_count = Item.products_count_for_site(current_user.site)
	  #end

	  @profiles = Profile.profile_views(current_user, current_user.site)

  end

end
