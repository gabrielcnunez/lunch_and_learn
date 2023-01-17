class Api::V1::FavoritesController < ApplicationController
  before_action :find_user
  
  def index
    if @user.nil?
      render json: ErrorSerializer.invalid_key, status: :bad_request
    else
      render json: FavoriteSerializer(@user.favorites)
    end
  end
  
  def create
    if @user.nil?
      render json: ErrorSerializer.invalid_key, status: :bad_request
    else
      favorite = Favorite.new(favorite_params)
      favorite.user_id = @user.id
      favorite.save
      render json: { success: "Favorite added successfully" }, status: :created
    end
  end

  private

    def find_user
      @user = User.find_by(api_key: params[:api_key])
    end

    def favorite_params
      params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
    end
end