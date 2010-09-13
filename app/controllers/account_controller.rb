class AccountController < ApplicationController
  layout  'staging_new'

  def login
    @current_section = :home
    case request.method
      when :post
      if session[:user] = User.authenticate(params[:user_login], params[:user_password])
        # debugger
        flash['notice']  = "Login successful"
        redirect_back_or_default :controller => 'definitions', :action => 'index_edit' #:action => "welcome"
      else
        flash.now['notice']  = "Login unsuccessful"

        @login = params[:user_login]
      end
    end
  end
  
  def signup
    @user = User.new(params[:user])
    @current_section = :home
    if request.post? and @user.save
      session[:user] = User.authenticate(@user.login, params[:user][:password])
      flash['notice']  = "Signup successful"
      redirect_back_or_default :action => "welcome"
    end      
  end  
  
  def logout
    session[:user] = nil
  end
    
  def welcome
  end
  
end
