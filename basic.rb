#!/usr/bin/env ruby

require 'optparse'

require 'parslet'

require_relative 'arguments'
require_relative 'exceptions'
require_relative 'line'
require_relative 'main'
require_relative 'parser'
require_relative 'parser_transform'
require_relative 'print_null'
require_relative 'print_statement'
require_relative 'print_tab'
require_relative 'program'
require_relative 'remark_statement'
require_relative 'statement'
require_relative 'statements'

Basic::Main.new(ARGV).run if $0 == __FILE__
