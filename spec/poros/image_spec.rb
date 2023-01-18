require "rails_helper"

RSpec.describe Image do 
  data = {
              alt_description: "time lapse photography of flying hot air balloon",
              urls: {
                        regular: "https://images.unsplash.com/photo-1540611025311"
                    }
          }          
  let(:image) { Image.new(data) }

  it "exists" do 
    expect(image).to be_an_instance_of(Image)
  end

  it "has readable attributes" do 
    expect(image.alt_tag).to eq("time lapse photography of flying hot air balloon")
    expect(image.url).to eq("https://images.unsplash.com/photo-1540611025311")
  end
end