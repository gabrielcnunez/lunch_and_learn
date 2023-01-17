class ErrorSerializer
  def self.missing_attributes(messages)
    {
      "message": "Record is missing one or more attributes",
      "errors": messages
    }
  end
end