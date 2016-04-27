module ErrorHandler

  def ErrorHandler.alert(error_message)
    raise RuntimeError, error_message
  end

end
