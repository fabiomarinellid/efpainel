class Backoffice::Config::UserController < ApplicationController
 before_action :set_admin, only: [:edit, :update, :destroy]
 before_action :carregaDropdowns, only: [:new , :create, :edit, :update]

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
      redirect_to backoffice_config_user_index_path, notice: "Novo Administrador #{@admin.name} salvo com sucesso"
    else
      render :new
    end
  end

  def edit
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

    if @admin.destroy
      redirect_to backoffice_config_user_index_path, notice: "Administrador #{admin_email} excluido com sucesso"
    else
      render :index
    end
  end

  private

    def carregaAdmins

      total_rows = 10

      if current_user.role == 'full_access'
        @admins = User.admins_for_all_sites(total_rows, current_user.id)
      else
        @admins = User.admins_for_any_sites(total_rows, current_user.site_id, current_user.id)
      end

    end

    def carregaDropdowns
      @sites = Site.all   
    end

    def set_admin
      @admin = User.find(params[:id])
    end

    def params_admin
        params.require(:user).permit(:photoavatar, :name, :email, :role, :password, :password_confirmation, :site_id)
    end
end
