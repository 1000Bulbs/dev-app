require 'rubygems'
require 'rake'
require 'haml'
require 'sass'

task :default => [:about, :fizzbuzz]

task :about do
  generate_html_with_layout '00-about_you/resume.html.haml', '00-about_you/resume.html'
  generate_css '00-about_you/style.scss', '00-about_you/style.css'
end

task :fizzbuzz do
  generate_html_with_layout '01-fizz_buzz/fizz_buzz.html.haml', '01-fizz_buzz/fizz_buzz.html'
  generate_css '01-fizz_buzz/style.scss', '01-fizz_buzz/style.css'
end

def generate_html_with_layout(haml_file, output)
  File.open(output, 'w') do |f| 
    regions = Regions.new
    unnamed = Haml::Engine.new(File.read(haml_file)).render(regions)

    output = Haml::Engine.new(File.read("src/layout.html.haml")).render do |region|
      region ? regions[region] : unnamed
    end
    f.write output
  end
end

def generate_css(infile, outfile)
  File.open(outfile, 'w') { |f| f.write Sass::Engine.for_file(infile, {style: :compact}).render }
end

# original by: http://stackoverflow.com/users/214790/matt
#   from: http://stackoverflow.com/a/6131411
class Regions  
  def initialize
    @regions_hash={}
  end

  def content_for(region, content = nil, &blk)  
    @regions_hash[region] = content.nil? ? capture_haml(&blk) : content
  end

  def [](region)
    @regions_hash[region]
  end
end
