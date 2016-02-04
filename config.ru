require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {  url: ENV['REDIS_URL'], namespace: ENV['REDIS_NAMESPACE'], size: (ENV['REDIS_SIZE'] || 1) }
end

require 'sidekiq/web'
require 'sidekiq/failures'

map '/' do
  use Rack::Auth::Basic, "Protected Area" do |username, password|
    username == 'sidekiq-web' && password == ENV["PASSWORD"]
  end

  run Sidekiq::Web
end
