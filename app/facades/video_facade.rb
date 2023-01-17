class VideoFacade
  def self.get_video(country)
    videos = VideosService.get_videos(country)
    if videos[:items].empty?
      nil
    else
      videos[:items].map do |video|
        Video.new(video)
      end.first
    end
  end
end