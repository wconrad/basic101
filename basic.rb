#!/usr/bin/env ruby

require 'csv'
require 'optparse'
require 'pp'

require 'parslet'

require_relative 'abs_function'
require_relative 'arguments'
require_relative 'asc_function'
require_relative 'basic_array'
require_relative 'basic_comparisons'
require_relative 'basic_float'
require_relative 'basic_integer'
require_relative 'basic_math'
require_relative 'basic_numeric'
require_relative 'basic_string'
require_relative 'binary_logic_operation'
require_relative 'binary_operation'
require_relative 'binary_operations'
require_relative 'boolean'
require_relative 'built_in_functions'
require_relative 'chr_function'
require_relative 'cos_function'
require_relative 'data_statement'
require_relative 'define_function_statement'
require_relative 'dim_statement'
require_relative 'else_statement'
require_relative 'end_statement'
require_relative 'endif_statement'
require_relative 'errors'
require_relative 'exp_function'
require_relative 'for_stack'
require_relative 'for_statement'
require_relative 'function_call'
require_relative 'function_identifier'
require_relative 'functions'
require_relative 'gosub_statement'
require_relative 'goto_statement'
require_relative 'identifier'
require_relative 'if_statement'
require_relative 'input'
require_relative 'input_reader'
require_relative 'input_statement'
require_relative 'int_function'
require_relative 'left_function'
require_relative 'len_function'
require_relative 'let_statement'
require_relative 'line'
require_relative 'log_function'
require_relative 'main'
require_relative 'mid_function'
require_relative 'negate_operation'
require_relative 'next_statement'
require_relative 'not_operation'
require_relative 'null_prompt_delimeter'
require_relative 'numeric_identifier'
require_relative 'on_goto_statement'
require_relative 'output'
require_relative 'parser'
require_relative 'power_operation'
require_relative 'print_comma'
require_relative 'print_semicolon'
require_relative 'print_statement'
require_relative 'program'
require_relative 'program_counter'
require_relative 'prompt_delimeter'
require_relative 'randomize_statement'
require_relative 'read_statement'
require_relative 'reference'
require_relative 'remark_statement'
require_relative 'restore_statement'
require_relative 'return_statement'
require_relative 'right_function'
require_relative 'rnd_function'
require_relative 'runtime'
require_relative 'scalar_reference'
require_relative 'sgn_function'
require_relative 'sin_function'
require_relative 'sqr_function'
require_relative 'statement'
require_relative 'stop_statement'
require_relative 'str_function'
require_relative 'string_identifier'
require_relative 'subscript_reference'
require_relative 'tab'
require_relative 'tab_function'
require_relative 'tan_function'
require_relative 'transform'
require_relative 'user_defined_function'

Basic::Main.new(ARGV).run if $0 == __FILE__
