class LearningResourceSerializer
  def self.serialize_resources(country, video, images)
    {
        data: {
            id: nil,
            type: "learning_resource",
            attributes: {
                country: country,
                video: {
                    title: video.title,
                    youtube_video_id: video.youtube_video_id
                },
                images: self.images_list(images)
            }
        }
    }
  end

  def self.images_list(images)
    images.each_with_object([]) do |image, list|
      image = {
          alt_tag: image.alt_tag,
          url: image.url
      }
      list << image
    end
  end
end