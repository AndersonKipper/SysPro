class LoginsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

def new
  session[:user_id] = nil
end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      if @user.email == "admin@syspro.com"
       redirect_to users_path
      else
      redirect_to projects_path, :notice => "Logado!"
    end
    else
     
     # flash.now.alert "Usuario ou senha invalida!"

     redirect_to login_path, :notice => "Nao foi possivel logar"
     
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Desconectado!"
  end
end
