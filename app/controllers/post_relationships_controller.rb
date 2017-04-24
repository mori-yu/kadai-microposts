class PostRelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Micropost.find(params[:fav_post_id])
    current_user.fav(post)
    flash[:success] = 'Micropostをお気に入り登録しました。'
    redirect_to root_path
  end

  def destroy
    post = Micropost.find(params[:fav_post_id])
    current_user.unfav(post)
    flash[:success] = 'Micropostのお気に入りを解除しました。'
    redirect_to root_path
  end
end
