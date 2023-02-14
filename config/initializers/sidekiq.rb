require "sidekiq"

# Sidekiq.default_worker_options["retry"] = 3

url = case Rails.env
  when "production", "staging"
    "redis://#{ENV["REDIS_HOST"]}:#{ENV["REDIS_PORT"]}/#{ENV["REDIS_DB"]}"
  else
    "redis://127.0.0.1:6379"
  end

Sidekiq.configure_server do |config|
  config.redis = {
    url: url
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: url
  }
end
