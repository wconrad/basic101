#!/usr/bin/env ruby

require 'optparse'

require 'parslet'

require_relative 'arguments'
require_relative 'basic_float'
require_relative 'basic_integer'
require_relative 'basic_string'
require_relative 'exceptions'
require_relative 'goto_statement'
require_relative 'int_function'
require_relative 'let_statement'
require_relative 'line'
require_relative 'main'
require_relative 'multiply'
require_relative 'output'
require_relative 'parser'
require_relative 'print_null'
require_relative 'print_statement'
require_relative 'print_tab'
require_relative 'program'
require_relative 'remark_statement'
require_relative 'rnd_function'
require_relative 'scalar_reference'
require_relative 'statement'
require_relative 'statements'
require_relative 'subscript_reference'
require_relative 'tab'
require_relative 'tab_function'
require_relative 'transform'

Basic::Main.new(ARGV).run if $0 == __FILE__
