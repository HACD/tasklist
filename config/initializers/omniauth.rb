Rails.application.config.middleware.use OmniAuth::Builder do
  CONSUMER_KEY='anonymous'
  CONSUMER_SECRET='anonymous'

  provider :google, CONSUMER_KEY, CONSUMER_SECRET
end