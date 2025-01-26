require "time"
require_relative 's3_rates_uploader'
require_relative 'json_fetcher'

trigger_time = Time.now

while true
  if Time.now >= trigger_time
    begin
      puts "File uploading triggered at #{Time.now.strftime("%H:%M")}"
      upload_file(update_currency_rates)
    rescue Exception => e
      puts "Something went wrong: #{e.message}"
    ensure
      trigger_time = Time.now + 14400
      puts "Next trigger: #{trigger_time.strftime("%H:%M")}"
    end
  end
  sleep(900)
end
