class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @street = Street.find(params[:relationship][:followed_id])
    current_user.follow!(@street)
    redirect_to @street
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to @user
  end
end