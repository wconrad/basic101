require 'simplecov'
SimpleCov.command_name 'RSpec'

require_relative '../../lib/basic101'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

glob = File.expand_path('support/**/*.rb', __dir__)
Dir[glob].sort.each do |path|
  require path
end
