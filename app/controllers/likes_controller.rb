class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(uid: session[:login_uid])
    user.likes.create_or_find_by!(tweet: tweet)
    redirect_to users_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    user = User.find_by(uid: session[:login_uid])
    tweet.likes.find_by(user_id: user.id).destroy
    redirect_to users_path
  end
end