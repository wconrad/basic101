#!/usr/bin/env ruby

require 'optparse'

require 'parslet'

require_relative 'arguments'
require_relative 'exceptions'
require_relative 'line'
require_relative 'main'
require_relative 'no_space_print_separator'
require_relative 'parser'
require_relative 'parser_transform'
require_relative 'print_statement'
require_relative 'program'
require_relative 'remark_statement'
require_relative 'statement'
require_relative 'statements'
require_relative 'tab_print_separator'

Basic::Main.new(ARGV).run if $0 == __FILE__
