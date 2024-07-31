class CustomFailure < Devise::FailureApp
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end

  def redirect_url
    new_user_session_url
  end

  def flash_message
    message = warden.message || warden_options[:message]
    message.is_a?(Symbol) ? I18n.t(:"devise.failure.#{message}", resource_name: resource_name) : message
  end
end
