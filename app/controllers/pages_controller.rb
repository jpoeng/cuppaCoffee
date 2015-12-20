class PagesController < ApplicationController
  def home
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end

    if params[:brand]
      @drinks = Drink.where(brand: params[:brand])
    else
    # By default this renders index
      @drinks = Drink.all
    end
  end
end
