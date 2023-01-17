class Api::V1::LearningResourcesController < ApplicationController
  def search
    video = VideoFacade.get_video(params[:country])
    images = ImagesFacade.get_images(params[:country])
    if video.nil? || images.nil?
      render json: LearningResourceSerializer.no_results_found(params[:country])
    else
      render json: LearningResourceSerializer.serialize_resources(params[:country], video, images)
    end
  end
end