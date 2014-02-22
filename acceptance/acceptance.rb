#!/usr/bin/env ruby

lib_path = File.expand_path('../lib', __dir__)
unless $LOAD_PATH.include?(lib_path)
  $:.unshift lib_path
end

require 'fileutils'
require 'optparse'
require 'stringio'
require 'tempfile'

require 'basic101'

require_relative 'arguments'
require_relative 'main'
require_relative 'test'

Acceptance::Main.new(ARGV).run if $0 == __FILE__
