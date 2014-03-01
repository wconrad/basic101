#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'
require 'stringio'
require 'tempfile'

require_relative '../basic'

require_relative 'arguments'
require_relative 'main'
require_relative 'test'

Acceptance::Main.new(ARGV).run if $0 == __FILE__
