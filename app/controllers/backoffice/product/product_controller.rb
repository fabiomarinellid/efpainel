class Backoffice::Product::ProductController < ApplicationController
  layout "backoffice"

  before_action :authenticate_user!
  def index
  	@products = Product.all
  end

  def edit
  end
end
