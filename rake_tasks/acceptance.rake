desc 'Run acceptance tests'
namespace :test do
  task :acceptance do
    command = File.expand_path('../acceptance/acceptance.rb',
                               File.dirname(__FILE__))
    sh command
  end
end
