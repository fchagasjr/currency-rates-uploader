require 'aws-sdk-s3'
require_relative 'json_fetcher'

def upload_file(filename)
  source_file = filename
  source_file_path = "./data/" + source_file
  target_file = "currencyRates.json"
  target_bucket = "jackofallunits.com"

  begin
    currencyRates = Aws::S3::Object.new(target_bucket, target_file)

    currencyRates.upload_file(source_file_path)

    puts "#{source_file} has been updated to #{target_file}"

  rescue Aws::Errors::ServiceError => e
    puts "Couldn't put your content to #{target_bucket}. Here's why: #{e.message}"
  end
end

upload_file(update_currency_rates)