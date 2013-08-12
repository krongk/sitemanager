#encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    authorize! :index, @user, :message => '没有权限访问.'
    @users = User.order("updated_at DESC").paginate(:page => params[:page]|| 1, :per_page => 20)
  end

  def show
    #authorize! :show, @user, :message => '没有权限访问.'
    @user = User.find(params[:id])
    @tags = @user.site_items.tag_counts_on(:tags)
  end
  
  def update
    authorize! :update, @user, :message => '没有权限访问.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => '没有权限访问.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end