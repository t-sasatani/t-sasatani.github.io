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
  if publication['individual_page'] == "TRUE"
    # Define the filename using a naming convention
    filename = "#{publication['title'].downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '')}.md"
    filepath = File.join(output_directory, filename)

    # Helper method to safely quote YAML strings
    def yaml_safe(string)
      string.to_s.gsub("'", "''")
    end

    # Generate the content with escaped single quotes
    content = <<~CONTENT
    ---
    layout: publication
    title: '#{yaml_safe(publication['title'])}'
    publication: '#{yaml_safe(publication['publication'])}'
    publication_abbr: '#{yaml_safe(publication['publication_abbr'])}'
    type: '#{yaml_safe(publication['type'])}'
    thumbnail: '#{yaml_safe(publication['thumbnail'])}'
    author: '#{yaml_safe(publication['author'] ? publication['author'].gsub(';', ', ') : '')}'
    year: '#{yaml_safe(publication['year'])}'
    month: '#{yaml_safe(publication['month'])}'
    month_str: '#{yaml_safe(publication['month_str'])}'
    volume: '#{yaml_safe(publication['volume'])}'
    issue: '#{yaml_safe(publication['Issue'])}'
    number: '#{yaml_safe(publication['number'])}'
    article: '#{yaml_safe(publication['article'])}'
    pages: '#{yaml_safe(publication['pages'])}'
    session: '#{yaml_safe(publication['session'])}'
    city: '#{yaml_safe(publication['city'])}'
    to_appear: '#{yaml_safe(publication['to_appear'])}'
    doi: '#{yaml_safe(publication['doi'])}'
    open_access: '#{yaml_safe(publication['open_access'])}'
    link: '#{yaml_safe(publication['link'])}'
    video: '#{yaml_safe(publication['video'])}'
    press_release_en: '#{yaml_safe(publication['press_release_en'])}'
    press_release_ja: '#{yaml_safe(publication['press_release_ja'])}'
    abstract: '#{yaml_safe(publication['abstract'])}'
    note: '#{yaml_safe(publication['note'])}'
    ---
  CONTENT

    # Write to file
    File.write(filepath, content)
    puts "Generated: #{filepath}"
  end
end