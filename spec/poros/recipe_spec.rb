require "rails_helper"

RSpec.describe Recipe do 
  data = {
            recipe: {
                        label: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                        url: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                        image: "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg"
                    }
          }
  country = 'thailand'          
  let(:recipe) { Recipe.new(data, country) }

  it "exists" do 
    expect(recipe).to be_an_instance_of(Recipe)
  end

  it "has readable attributes" do 
    expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipe.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    expect(recipe.country).to eq("thailand")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg")
  end
end