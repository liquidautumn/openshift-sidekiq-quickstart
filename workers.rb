# Please require all Sidekiq workers here.
#

require_relative './lib/workers/example_worker.rb'

# Example of how to call the task:
#

ExampleWorker.async_perform
