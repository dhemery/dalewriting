require 'rake/clean'

common_dir = 'common'
common_content_dir = File.join(common_dir, 'content')
common_theme_dir = File.join(common_dir, 'theme')

custom_content_dir = 'content'
custom_theme_dir = 'theme'
custom_config_file = 'config.yml'

build_dir = 'build'
build_config_file = File.join(build_dir, '_config.yml')
build_style_dir = File.join(build_dir, '_style')
site_dir = 'site'

task :default => [:prep]

desc "Combine the common and custom content into the build directory"
task :prep => [:content, :theme]

task :content => [:common_content] do
    Dir.foreach(custom_content_dir) { |f| cp_r File.join(custom_content_dir, f), build_dir unless f.start_with?('.') }
    `cat #{custom_config_file} >> #{build_config_file}`
end

task :common_content => [:build_dir] do
    Dir.foreach(common_content_dir) { |f| cp_r File.join(common_content_dir, f), build_dir unless f.start_with?('.') }
end

task :theme => [:common_theme] do
    Dir.foreach(custom_theme_dir) { |f| cp_r File.join(custom_theme_dir, f), build_dir unless f.start_with?('.') }
end

task :common_theme => [:build_dir] do
    Dir.foreach(common_theme_dir) { |f| cp_r File.join(common_theme_dir, f), build_dir unless f.start_with?('.') }
end

desc "Generate the style sheet"
task :stylesheet => [:theme] do
    `compass compile #{build_style_dir}`
end

task :build_dir do
    mkdir_p build_dir
end

desc "Generate the site"
task :site => [:prep, :stylesheet] do
    `cd #{build_dir} && pwd && jekyll --server`
end

CLEAN.include build_dir, site_dir
