class StreetsController < ApplicationController
  def index
    @street = Street.all

  end

  def show
    @user = current_user
    @street = Street.find(params[:id])
    @microposts = @street.microposts
  end

    def followers

    @user = current_user
    @street = Street.find(params[:id])
    @streets = @street.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
