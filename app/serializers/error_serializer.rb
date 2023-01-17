class ErrorSerializer
  def self.registration_errors(messages)
    {
      "message": "Registration cannot be completed",
      "errors": messages
    }
  end
end