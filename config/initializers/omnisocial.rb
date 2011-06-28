Omnisocial.setup do |config|

  # ==> Twitter
  # config.twitter 'APP_KEY', 'APP_SECRET'

  # ==> Facebook
  config.facebook '525c5d68108f4a1a4120c2d7e139a8b0', '34a6850dca7c63cc7696dd0c4a737915', 
    :scope => ['publish_stream', 'user_relationships']
  
  # ==> GitHub
  # config.github 'APP_KEY', 'APP_SECRET'
  
  # ==> LinkedIn
  # config.linked_in 'APP_KEY', 'APP_SECRET'

  if Rails.env.production?

    # Configs for production mode go here

  elsif Rails.env.development?

    # Configs for development mode go here

  end

end
