class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    m = Micropost.find(params[:micropost_id])
    current_user.like(m)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to root_url
  end

  def destroy
    m = Micropost.find(params[:micropost_id])
    current_user.unlike(m)
    flash[:success] = 'お気に入りに解除しました。'
    redirect_to root_url
  end
end
