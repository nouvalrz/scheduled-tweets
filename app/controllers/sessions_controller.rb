class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Login Successfully!"
        else
            flash[:alert] = "User or Password Invalid!"
            redirect_to login_path
       end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged Out"
    end
end