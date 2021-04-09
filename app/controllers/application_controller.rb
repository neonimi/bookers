class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	# before_action :authenticate_user!
  	before_action :configure_permitted_parameters, if: :devise_controller?
  
	def after_sign_in_path_for(resource)
		user_path(current_user)	
	end

  protected

    def configure_permitted_parameters
      # sign_upのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :image])
      # account_updateのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :image])
    end

end