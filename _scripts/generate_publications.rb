require 'yaml'
require 'fileutils'

# Path to the YAML file
publications_file = File.join(__dir__, '..', '_data', 'publication.yml')
# Directory to store the generated Markdown files
output_directory = '_publications'

# Create the output directory if it does not exist
FileUtils.mkdir_p(output_directory)

# Delete all markdown files in the output directory
Dir.glob(File.join(output_directory, '*.md')).each do |file|
  File.delete(file)
end

# Load the YAML file
publications = YAML.load_file(publications_file)

# Iterate over each publication entry
publications.each do |publication|
  # Define the filename using a naming convention
  filename = "#{publication['title'].downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '')}.md"
  filepath = File.join(output_directory, filename)

  # Generate the content
  content = <<~CONTENT
    ---
    layout: publication
    title: "#{publication['title']}"
    authors: "#{publication['author']}"
    ---
  CONTENT

  # Write to file
  File.write(filepath, content)
  puts "Generated: #{filepath}"
end