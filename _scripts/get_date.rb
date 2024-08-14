require 'yaml'
require 'date'

current_date = Date.today.to_s
yaml_file_path = '_data/metadata.yml'
data = YAML.load_file(yaml_file_path)
metadata['gsheet_update'] = current_date
File.open(yaml_file_path, 'w') do |file|
  file.write(data.to_yaml)
end

puts "Date updated to #{current_date} in #{yaml_file_path}"