class Backoffice::Config::UserController < ApplicationController
 before_action :set_admin, only: [:edit, :update, :destroy]
 before_action :carregaDropdowns, only: [:index, :new , :create, :edit, :update]

  layout "Backoffice"
  before_action :authenticate_user!

  def index
    carregaAdmins
  end

  def new
    @admin = User.new
  end

  def create
    @admin = User.new(params_admin)
    if @admin.save
      insert_profiles(1, 1, 1, 1, @admin.id, @admin.site)

        if(@admin.role == restricted_access)
          redirect_to edit_backoffice_config_user_path(@admin), 
          notice: "Novo Administrador #{@admin.name} cadastrado com sucesso, altere os módulos de acesso abaixo."
        else
          redirect_to backoffice_config_user_index_path, notice: "Novo Administrador #{@admin.name} salvo com sucesso"
        end
    else
      render :new
    end
  end

  def edit
      @profiles_admin_set = Profile.profile_user_id(@admin)
      alter_profiles
  end

  def update
    if @admin.update(params_admin)
      redirect_to backoffice_config_user_index_path, notice: "Administrador #{@admin.name} alterado com sucesso"
    else
      render :edit
    end
  end

  def destroy

    admin_email = @admin.email

    if Profile.where(user_id: @admin.id).destroy_all
      if @admin.destroy
        redirect_to backoffice_config_user_index_path, notice: "Administrador #{admin_email} excluido com sucesso"
      else
        render :index
      end
    else
      redirect_to edit_backoffice_config_user_path(@admin), notice: "Não foi possivel exluir o perfil do usuario #{@admin.name}"
    end
  end

  private

    def carregaAdmins

      total_rows = 10
      
      @admins = User.admins_for_any_sites(total_rows, current_user.site,  current_user.id)

    end

    def carregaDropdowns
      @sites = Site.all   
      @profiles = Profile.profile_user_id(current_user)
    end

    def set_admin
      @admin = User.find(params[:id])
    end

    def params_admin
        params.require(:user).permit(:photoavatar, :name, :email, :role, :password, :password_confirmation, :site)
    end

    def params_profile
        params.require(:profile).permit(:code, :description, :father ,:route ,:read ,:create ,:edit ,:erase ,:active ,:order ,:icon ,:user_id ,:site_id, :level, :controller_name)
    end

    def insert_profiles(read, create, edit, erase, user, site)

        Profile.create(
          [
            { :code =>  1, :description =>  'Principal', :father =>  nil ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  1 ,:icon =>  nil ,:user_id =>  user ,:site_id =>  site, :level =>  1, :controller_name =>  'main' },
            { :code =>  2, :description =>  'Dashboard', :father =>  1 ,:route =>  'backoffice_dashboard_index_path' ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  2 ,:icon =>  'fas fa-chart-line' ,:user_id =>  user ,:site_id =>  site, :level =>  2, :controller_name => 'dashboard'  },
            { :code =>  3, :description =>  'Sites', :father =>  1 ,:route =>  'backoffice_config_site_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  3 ,:icon =>  'icon-website' ,:user_id =>  user ,:site_id =>  site, :level =>  2, :controller_name => 'site'  },
            { :code =>  4, :description =>  'Admins', :father =>  1 ,:route =>  'backoffice_config_user_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  4 ,:icon =>  'icon-user-1' ,:user_id =>  user ,:site_id =>  site, :level =>  2, :controller_name => 'user'  },
            { :code =>  5, :description =>  'Cadastros', :father =>  nil ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  5 ,:icon =>  nil ,:user_id =>  user ,:site_id =>  site, :level =>  1, :controller_name =>  'register'  },
            { :code =>  6, :description =>  'Info', :father =>  5 ,:route =>  nil ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  6 ,:icon =>  'fas fa-info' ,:user_id =>  user ,:site_id =>  site, :level =>  3, :controller_name =>  'info'  },
            { :code =>  7, :description =>  'Titulos', :father =>  6 ,:route =>  'backoffice_config_title_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  7 ,:icon =>  'fas fa-heading' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'title'  },
            { :code =>  8, :description =>  'Sobre', :father =>  6 ,:route =>  'backoffice_config_about_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  8 ,:icon =>  'fas fa-address-card' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'about'  },
            { :code =>  9, :description =>  'Cardápio', :father =>  5 ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  9 ,:icon =>  'fas fa-list' ,:user_id =>  user ,:site_id =>  site, :level =>  3, :controller_name =>  'menu'  },
            { :code =>  10, :description =>  'Categoria', :father =>  9 ,:route =>  'backoffice_product_category_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  10 ,:icon =>  'icon-list' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'category'  },
            { :code =>  11, :description =>  'Etiquetas', :father =>  9 ,:route =>  'backoffice_product_label_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  11 ,:icon =>  'fas fa-tags' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'label'  },
            { :code =>  12, :description =>  'Produtos', :father =>  9 ,:route =>  'backoffice_product_product_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  12 ,:icon =>  'fas fa-hamburger' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'product'  },
            { :code =>  13, :description =>  'Obs', :father =>  9 ,:route =>  'backoffice_product_observation_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  13 ,:icon =>  'fas fa-exclamation' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'observation'  },
            { :code =>  14, :description =>  'Contatos', :father =>  5 ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  14 ,:icon =>  'fas fa-address-book' ,:user_id =>  user ,:site_id =>  site, :level =>  3, :controller_name =>  'contact'  },
            { :code =>  15, :description =>  'Telefone', :father =>  14 ,:route =>  'backoffice_contact_phone_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  15 ,:icon =>  'fas fa-mobile-alt' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'phone'  },
            { :code =>  16, :description =>  'Endereço', :father =>  14 ,:route =>  'backoffice_contact_address_index_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  16 ,:icon =>  'fas fa-map-marked' ,:user_id =>  user ,:site_id =>  site, :level =>  4, :controller_name => 'address'  },
            { :code =>  17, :description =>  'Links', :father =>  nil ,:route =>  nil ,:read =>  read ,:create =>  0 ,:edit =>  0 ,:erase =>  0 ,:active =>  1 ,:order =>  17 ,:icon =>  nil ,:user_id =>  user ,:site_id =>  site, :level =>  1, :controller_name =>  'link'  },
            { :code =>  18, :description =>  'Link do Site', :father =>  17 ,:route =>  'root_path' ,:read =>  read ,:create =>  create ,:edit =>  edit ,:erase =>  erase ,:active =>  1 ,:order =>  18 ,:icon =>  'fas fa-link' ,:user_id =>  user ,:site_id =>  site, :level =>  2, :controller_name =>  'site_link'  }
          ]
        )

    end

    def alter_profiles

      unless(request.query_parameters["commit"].blank?)

        @profiles_admin_set.each do |profile|

          @profile = Profile.find(profile.id)

          request.query_parameters["#{@profile.code}-0"] ? @profile.update(read: 1) : @profile.update(read: 0)
          request.query_parameters["#{@profile.code}-1"] ? @profile.update(create: 1) : @profile.update(create: 0)
          request.query_parameters["#{@profile.code}-2"] ? @profile.update(edit: 1) : @profile.update(edit: 0)
          request.query_parameters["#{@profile.code}-3"] ? @profile.update(erase: 1) : @profile.update(erase: 0)
            
        end
        redirect_to edit_backoffice_config_user_path(@admin), notice: "Perfil de acesso do usuário #{@admin.name} salvo com sucesso"
      end
    end
    
  
end
