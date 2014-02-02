#!/usr/bin/env ruby

require 'optparse'

require_relative 'arguments'
require_relative 'main'

Basic::Main.new(ARGV).run if $0 == __FILE__
