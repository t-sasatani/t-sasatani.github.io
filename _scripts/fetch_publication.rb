require 'open-uri'
require 'csv'
require 'yaml'

# Replace with your Google Sheet's published CSV URL
csv_url = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR2On3N_zySnJdNc9hGJozMkjrkBVwArZppAEUQg4LlYBny9IwkAtBss5-yfgGg0TYWkR_NhZd-QWIr/pub?gid=0&single=true&output=csv'

csv_data = URI.open(csv_url).read
parsed_data = CSV.parse(csv_data, headers: true)

data = parsed_data.map(&:to_h).map do |row|
  row.transform_keys(&:to_s) # Ensure keys are strings
end

yaml_data = data.to_yaml

File.write('_data/publications.yml', yaml_data)

puts "Data fetched and saved to _data/publications.yml"