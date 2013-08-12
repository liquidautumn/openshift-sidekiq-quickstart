# Please require all Sidekiq workers here.
#

require_relative './lib/workers/example_worker.rb'

# NOTE: This require the Redis cartridge to be installed.
#       https://github.com/smarterclayton/openshift-redis-cart

REDIS_CONFIG = {
  url: "redis://:#{ENV['REDIS_PASSWORD']}@#{ENV['OPENSHIFT_REDIS_HOST']}:#{ENV['OPENSHIFT_REDIS_PORT']}"
}

Sidekiq.configure_server do |config|
  config.redis = REDIS_CONFIG
end

Sidekiq.configure_client do |config|
  config.redis = REDIS_CONFIG
end

# Example of how to call the task:
#

ExampleWorker.perform_async
