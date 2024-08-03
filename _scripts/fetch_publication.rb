require 'open-uri'
require 'csv'
require 'yaml'

# Define a hash with sheet names and their corresponding Google Sheet's published CSV URLs
sheet_urls = {
  'publication' => 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR2On3N_zySnJdNc9hGJozMkjrkBVwArZppAEUQg4LlYBny9IwkAtBss5-yfgGg0TYWkR_NhZd-QWIr/pub?gid=0&single=true&output=csv',
  'career' => 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR2On3N_zySnJdNc9hGJozMkjrkBVwArZppAEUQg4LlYBny9IwkAtBss5-yfgGg0TYWkR_NhZd-QWIr/pub?gid=1378472553&single=true&output=csv',
  'award' => 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR2On3N_zySnJdNc9hGJozMkjrkBVwArZppAEUQg4LlYBny9IwkAtBss5-yfgGg0TYWkR_NhZd-QWIr/pub?gid=1749229257&single=true&output=csv',
  'education' => 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR2On3N_zySnJdNc9hGJozMkjrkBVwArZppAEUQg4LlYBny9IwkAtBss5-yfgGg0TYWkR_NhZd-QWIr/pub?gid=759938177&single=true&output=csv',
}

sheet_urls.each do |sheet_name, csv_url|
  csv_data = URI.open(csv_url).read
  parsed_data = CSV.parse(csv_data, headers: true)

  data = parsed_data.map(&:to_h).map do |row|
    row.transform_keys(&:to_s) # Ensure keys are strings
  end

  yaml_data = data.to_yaml

  # Save each sheet's data into a different YAML file
  file_path = "_data/#{sheet_name}.yml"
  File.write(file_path, yaml_data)

  puts "Data for #{sheet_name} fetched and saved to #{file_path}"
end