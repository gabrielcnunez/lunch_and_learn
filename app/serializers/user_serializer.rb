class UserSerializer 
  include JSONAPI::Serializer

  attributes :name, :email, :api_key
end 