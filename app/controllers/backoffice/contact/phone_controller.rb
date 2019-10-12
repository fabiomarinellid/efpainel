class Backoffice::Contact::PhoneController < ApplicationController

 layout "backoffice"

 before_action :authenticate_user!
  def index
  	@phones = Phone.all
  end

  def edit
  end
end
