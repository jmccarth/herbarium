class ApplicationController < ActionController::Base
  protect_from_forgery

	def valid_user()
    	return User.where(username: session[:cas_user]).length > 0
  	end

  	def validate_user()
  		unless valid_user
    		flash[:notice] = "User " + session[:cas_user] + " does not have permission to edit the herbarium."
    		redirect_to (root_path)
    	end
  	end
end
