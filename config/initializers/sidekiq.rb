redis_conn = proc {
  Redis.new(
  url:  ENV["REDIS_HOST"],
  password: ENV["REDIS_PASSWORD"],
  network_timeout: 5 
  	)
}

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: 5, &redis_conn)
end

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: 25, &redis_conn)
end