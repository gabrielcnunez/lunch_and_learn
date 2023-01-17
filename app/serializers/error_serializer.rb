class ErrorSerializer
  def self.registration_errors(messages)
    {
      "message": "Registration cannot be completed",
      "errors": messages
    }
  end
  
  def self.invalid_key
    {
      "message": "Invalid api-key",
      "errors": ["No user found with the api-key submitted"]
    }
  end
end