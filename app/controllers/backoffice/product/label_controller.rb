class Backoffice::Product::LabelController < ApplicationController

  layout "backoffice"

  before_action :authenticate_user!
  def index
  	@labels = Label.all
  end

  def edit
  end
end
