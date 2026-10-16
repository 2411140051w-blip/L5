class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(uid: params[:user][:title], pass: params[:user][:pass])
        if @user.save
            flash[:notice] = 'ユーザを追加しました'
            redirect_to root_path #=>一覧ページにリダイレクトする
        else
            render new_user_path, status: :unprocessable_content
        end
    end

    def destroy
        @user = User.find(params[:uid])
    if @user.destroy
      flash[:notice] = '１レコード削除しました'
      redirect_to root_path
    else
      flash[:notice] = '削除に失敗しました'
    end
    end
        
end
