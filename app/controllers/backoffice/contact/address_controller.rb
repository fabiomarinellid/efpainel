class Backoffice::Contact::AddressController < ApplicationController

 layout "backoffice"

 before_action :authenticate_user!
  def index
  	@address = Adress.all
  end

  def edit
  end
end
