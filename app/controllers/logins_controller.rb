class LoginsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to projects_path, :notice => "Logado!"
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
