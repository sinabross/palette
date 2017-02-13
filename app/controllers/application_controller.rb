class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  

   before_action :configure_permitted_parameters, if: :devise_controller?
   
  protected

 
 
  def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :username, :userseason, :birthday) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :username, :password, :password_confirmation, :current_password) }
  end


  # rowsPerPage 
  # 한 페이지당 표시될 게시물 수
  # 모든 컨트롤러에서 사용가능하도록 여기에 정의.
    def rowsPerPage
        @rowsPerPage ||= 5
    end
  
end
