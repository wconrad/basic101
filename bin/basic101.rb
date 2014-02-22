#!/usr/bin/env ruby

lib_path = File.expand_path('../lib', __dir__)
unless $LOAD_PATH.include?(lib_path)
  $:.unshift lib_path
end

require 'basic101'

Basic101::Main.new(ARGV).run if $0 == __FILE__
