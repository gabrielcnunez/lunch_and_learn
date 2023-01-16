class Api::V1::LearningResourcesController < ApplicationController
  def search
    country = params[:country]
    video = VideoFacade.get_video(country)
    images = ImagesFacade.get_images(country)
    render json: LearningResourceSerializer.new(video, images)
  end
end