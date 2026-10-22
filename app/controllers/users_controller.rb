class UsersController < ApplicationController
    def index
        @user = User.all
        @tweets = Tweet.includes(:user).all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(uid: params[:user][:uid], pass: params[:user][:pass])
        if @user.save
            flash[:notice] = 'ユーザを追加しました'
            redirect_to users_path #=>一覧ページにリダイレクトする
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
    if @user.destroy
        flash[:notice] = '１レコード削除しました'
        redirect_to users_path
    else
        flash[:notice] = '削除に失敗しました'
    end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update(uid: params[:user][:uid])
        redirect_to users_path
    end
        
end
