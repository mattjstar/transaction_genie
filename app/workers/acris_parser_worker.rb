class AcrisParserWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, backtrace: true

  def perform(file_url)
    AcrisParserService.new(file_url).perform
  end
end