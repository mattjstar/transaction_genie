namespace :parse do
  desc "This task uploads scrapped acris transactions for Parcels and Documents"
  task acris_jsons: :environment do
    AcrisParserService.new(File.read('example.json')).perform
  end
end