class TweetsController < ApplicationController
    def index
        @tweet = Tweet.all
    end

    def new
        @tweet = Tweet.new
    end

    def create
        user = User.find_by(uid: session[:login_uid])
        @tweet = Tweet.new(user_id: user.id , message: params[:tweet][:message])
        if @tweet.save
            flash[:notice] = 'ユーザを追加しました'
            redirect_to root_path #=>一覧ページにリダイレクトする
        else
            render new_tweet_path, status: :unprocessable_content
        end
    end

    def destroy
        @tweet = Tweet.find(params[:id])
    if @tweet.destroy
        flash[:notice] = '１レコード削除しました'
        redirect_to root_path
    else
        flash[:notice] = '削除に失敗しました'
    end
    end
        
end
