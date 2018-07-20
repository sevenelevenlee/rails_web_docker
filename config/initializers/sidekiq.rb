Sidekiq.configure_server do |config|
    # config.redis = { url: 'redis://redis_com:6379/11', namespace: "sywh_back" }
    config.redis = { url: "redis://redis_com:6379/11" }
end

Sidekiq.configure_client do |config|
    # config.redis = { url: 'redis://redis_com:6379/11', namespace: "sywh_back" }
    config.redis = { url: "redis://redis_com:6379/11" }
end
require 'sidekiq'
require 'sidekiq/web'
Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == ["sywh", "sywh%2018"]
end
