require "rails_helper"

RSpec.describe Video do 
  data = {
              snippet: {
                            title: "A Super Quick History of Laos"
                        },
              id: {
                      videoId: "eXSs0QJ3Dww"     
                  }
          }          
  let(:video) { Video.new(data) }

  it "exists" do 
    expect(video).to be_an_instance_of(Video)
  end

  it "has readable attributes" do 
    expect(video.title).to eq("A Super Quick History of Laos")
    expect(video.youtube_video_id).to eq("eXSs0QJ3Dww")
  end
end