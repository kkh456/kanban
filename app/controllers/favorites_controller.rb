class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(list_id: params[:list_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @list = List.find(params[:list_id])
    @favorite = current_user.favorites.find_by(list_id: @list.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
