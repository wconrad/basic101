desc 'Run integration tests'
namespace :test do
  task :integration do
    command = File.expand_path('../test/integration/integration_test.rb',
                               __dir__)
    sh command
  end
end
