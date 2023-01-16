class VideoFacade
  def self.get_video(country)
    videos = VideosService.get_videos(country)
    videos[:items].first.map do |video|
      Video.new(video)
    end
  end
end