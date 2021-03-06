Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, fields: [:email, :name], model: User, on_failed_registration: lambda { |env|      
    UsersController.action(:new).call(env)  
  }
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  provider :facebook, "536159993072259", "68fcf96519f8ecaab34473583bbaebb0",
           :scope => 'email,user_birthday,read_stream', :display => 'popup'

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
  

end
