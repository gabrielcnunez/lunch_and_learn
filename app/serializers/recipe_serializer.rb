class RecipeSerializer 
  include JSONAPI::Serializer

  set_id {null}
  attributes :title, :url, :country, :image
end 