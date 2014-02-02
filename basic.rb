#!/usr/bin/env ruby

require 'optparse'

require_relative 'arguments'
require_relative 'exceptions'
require_relative 'statement'
require_relative 'lines'
require_relative 'main'
require_relative 'program'

Basic::Main.new(ARGV).run if $0 == __FILE__
