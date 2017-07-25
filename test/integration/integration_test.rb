#!/usr/bin/env ruby
# frozen_string_literal: true

$VERBOSE=true

# Must come first
require 'simplecov'
SimpleCov.command_name 'Integration'

lib_path = File.expand_path('../../lib', __dir__)
unless $LOAD_PATH.include?(lib_path)
  $:.unshift lib_path
end

require 'fileutils'
require 'forwardable'
require 'optparse'
require 'pathname'
require 'stringio'
require 'tempfile'
require 'yaml'

require 'basic101'

require_relative 'arguments'
require_relative 'errors'
require_relative 'main'
require_relative 'output_file'
require_relative 'test'

Integration::Main.new(ARGV).run if $0 == __FILE__
