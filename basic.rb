#!/usr/bin/env ruby

require 'optparse'

require_relative 'arguments'
require_relative 'exceptions'
require_relative 'main'
require_relative 'program'
require_relative 'statement'
require_relative 'statements'

Basic::Main.new(ARGV).run if $0 == __FILE__
