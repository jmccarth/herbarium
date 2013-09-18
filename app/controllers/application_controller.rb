class ApplicationController < ActionController::Base
  protect_from_forgery

	def valid_user()
    	unless User.where(username: session[:cas_user]).length > 0
    		flash[:notice] = "User " + session[:cas_user] + " does not have permission to edit the herbarium."
    		redirect_to (root_path)
    	end
  	end


end
