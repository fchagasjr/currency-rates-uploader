require 'net/http'
require 'json'
require 'time'

def update_currency_rates
  begin
    # API URL
    api_id = ENV["OPENEXCHANGE_API"]

    url = "https://openexchangerates.org/api/latest.json?app_id=#{api_id}"

    # Fetch data from the API
    uri = URI(url)
    response = Net::HTTP.get(uri)

    # Parse the JSON response
    data = JSON.parse(response)

    # Format time_last_updated to MM/DD/YYYY HH:MM:SS UTC
    formatted_time = Time.at(data['timestamp']).utc.strftime('%m/%d/%Y %H:%M:%S UTC')

    # Clean the JSON by removing unnecessary fields and formatting time
    cleaned_data = {
      'base' => data['base'],
      'time' => formatted_time,
      'rates' => data['rates']
    }

    # Save the cleaned JSON to a file
    File.open('currencyRates.json', 'w') do |file|
      file.write(JSON.pretty_generate(cleaned_data))
    end

    puts 'currencyRates.json has been successfully updated!'

  rescue JSON::ParserError => e
    puts "Error: Failed to parse JSON response. Details: #{e.message}"
  rescue Errno::ENOENT => e
    puts "Error: File operation failed. Details: #{e.message}"
  rescue StandardError => e
    puts "An unexpected error occurred: #{e.message}"
  end
end

# Call the function
update_currency_rates
