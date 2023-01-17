class ErrorSerializer
  def self.registration_error(messages)
    {
      "message": "Registration cannot be completed",
      "errors": messages
    }
  end
end