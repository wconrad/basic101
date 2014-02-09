#!/usr/bin/env ruby

require 'csv'
require 'optparse'
require 'pp'

require 'parslet'

require_relative 'add'
require_relative 'arguments'
require_relative 'basic_float'
require_relative 'basic_integer'
require_relative 'basic_string'
require_relative 'binary_math_operation'
require_relative 'binary_operation'
require_relative 'binary_operations'
require_relative 'boolean'
require_relative 'divide'
require_relative 'end_statement'
require_relative 'equal'
require_relative 'errors'
require_relative 'goto_statement'
require_relative 'greater'
require_relative 'greater_or_equal'
require_relative 'identifier'
require_relative 'if_statement'
require_relative 'input'
require_relative 'input_reader'
require_relative 'input_statement'
require_relative 'int_function'
require_relative 'less'
require_relative 'less_or_equal'
require_relative 'let_statement'
require_relative 'line'
require_relative 'main'
require_relative 'multiply'
require_relative 'not_equal'
require_relative 'numeric_identifier'
require_relative 'output'
require_relative 'parser'
require_relative 'print_null'
require_relative 'print_statement'
require_relative 'print_tab'
require_relative 'program'
require_relative 'program_counter'
require_relative 'randomize_statement'
require_relative 'remark_statement'
require_relative 'rnd_function'
require_relative 'runtime'
require_relative 'scalar_reference'
require_relative 'statement'
require_relative 'string_identifier'
require_relative 'subscript_reference'
require_relative 'subtract'
require_relative 'tab'
require_relative 'tab_function'
require_relative 'transform'
require_relative 'wrap_value'

Basic::Main.new(ARGV).run if $0 == __FILE__
