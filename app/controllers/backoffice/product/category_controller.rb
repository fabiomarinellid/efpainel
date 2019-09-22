class Backoffice::Product::CategoryController < ApplicationController
 
 layout "backoffice"

 before_action :authenticate_user!
 def index
 	
 end
end
