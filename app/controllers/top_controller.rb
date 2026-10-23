class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "login"
        else
            render "login_form"
        end
    end

    def login
        user = User.find_by(uid: params[:uid])
        if user and user.authenticate(params[:pass])
            session[:login_uid] = params[:uid]
            redirect_to users_path
        else
            render "error", status: :unprocessable_entity
        end
    end

    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
