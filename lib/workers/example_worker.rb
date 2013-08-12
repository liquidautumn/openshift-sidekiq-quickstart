class ExampleWorker
  include Sidekiq::Worker

  # You can call this method by: ExampleWorker.perform_async
  #
  def perform
    puts "Performing the example worker task..."
    sleep(2)
    puts "Finished!"
  end

end
