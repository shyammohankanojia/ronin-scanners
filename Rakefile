require 'rubygems'

begin
  require 'bundler'
rescue LoadError => e
  STDERR.puts e.message
  STDERR.puts "Run `gem install bundler` to install Bundler."
  exit e.status_code
end

begin
  Bundler.setup(:development)
rescue Bundler::BundlerError => e
  STDERR.puts e.message
  STDERR.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'

require 'rubygems/tasks'
Gem::Tasks.new(:sign => {:checksum => true, :pgp => true}) do |tasks|
  tasks.scm.tag.format  = 'v%s'
  tasks.console.command = 'ripl'
  tasks.console.options = %w[
    -rripl/multi_line
    -rripl/auto_indent
    -rripl/color_result
  ]
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :test => :spec
task :default => :spec

require 'dm-visualizer/rake/graphviz_task'
DataMapper::Visualizer::Rake::GraphVizTask.new(
  :bundle => [:runtime],
  :include => ['lib'],
  :require => ['ronin/scanners']
)

require 'yard'
YARD::Rake::YardocTask.new
