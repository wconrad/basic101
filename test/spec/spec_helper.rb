# simplecov must come first
require 'simplecov'
SimpleCov.command_name 'RSpec'

require 'rspec/its'

require_relative '../../lib/basic101'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
end

glob = File.expand_path('support/**/*.rb', __dir__)
Dir[glob].sort.each do |path|
  require path
end
