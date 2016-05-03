class AcrisParserWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(file_url)
    AcrisParserService.new(File.read(file_url)).perform
  end
end