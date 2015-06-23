class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
 protect_from_forgery
  helper_method :current_user
  before_filter :require_login

private

def require_login
	unless logged_in?
		flash[:error] = 'Voce precisa estar logado'
		redirect_to login_path, :notice => 'Voce precisa estar logado'
	end
end

def logged_in?
	!!current_user
end

def current_user
	@_current_user ||= session[:user_id] &&
	User.find_by_id(session[:user_id])
end

end
