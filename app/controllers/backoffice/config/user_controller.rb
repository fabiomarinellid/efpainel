class Backoffice::Config::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :carregaDropdowns

  layout "Backoffice"
  

  def index
    carregaAdmins
  end

  def new
    @admin = User.new
  end

  def create

    begin

      @admin = User.new(params_admin)
      if @admin.save
  
        @route = Profile.route_current_site(current_user.site, current_user.id)
        Profile.insert_profiles(1, 1, 1, 1, @admin.id, @admin.site, @route[0].route)
  
        redirect_to edit_backoffice_config_user_path(@admin, anchor: "profile"), 
        notice: "Novo Administrador #{@admin.name} cadastrado com sucesso, abaixo é o controle de acesso."
      else
        render :new
      end
      
    rescue StandardError => e

      flash.now[:notice] = "Erro ao cadastrar usuario: #{e}"
      
    end
    
   
  end

  def edit
      @profiles_admin_set = Profile.profile(@admin, @admin.site)
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
      unless(Profile.read_permit(4, current_user.id, current_user.site) == 0)
        @admins = User.admins_for_any_sites("%#{params[:q]}%", current_user.site, current_user.id).page(params[:page]).per(5)
        @adminsCount = @admins.count
      else
        redirect_to "/422.html"
      end
    end

    def carregaDropdowns
      @sites = Site.all   
      unless(current_user.blank?)
        @profiles = Profile.profile_views(current_user, current_user.site)
      end
    end

  
    def set_admin
      @admin = User.find(params[:id])
    end

    def params_admin
        params.require(:user).permit(:photoavatar, :name, :email, :role, :password, :password_confirmation, :site)
    end
 
    #Inicio dos Profile
  
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

    #fim do Profiles
    
  
end
