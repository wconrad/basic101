require 'rspec/core/rake_task'

Bundler.setup(:test)

RSpec::Core::RakeTask.new 'test:spec' do |t|
  t.pattern = File.join('test', t.pattern)
  t.verbose = false
end

task :spec => ['test:spec']
