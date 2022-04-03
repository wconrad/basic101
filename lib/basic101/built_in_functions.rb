# frozen_string_literal: true

require_relative 'abs_function'
require_relative 'asc_function'
require_relative 'chr_function'
require_relative 'cos_function'
require_relative 'exp_function'
require_relative 'int_function'
require_relative 'lcase_function'
require_relative 'left_function'
require_relative 'len_function'
require_relative 'log_function'
require_relative 'mid_function'
require_relative 'right_function'
require_relative 'rnd_function'
require_relative 'sgn_function'
require_relative 'sin_function'
require_relative 'sqr_function'
require_relative 'str_function'
require_relative 'tab_function'
require_relative 'tan_function'
require_relative 'ucase_function'
require_relative 'val_function'

module Basic101

  module BuiltInFunctions

    # NOTE: When adding a function to this list, you must also add it
    # to the list of built-in functions in parser/identifier.rb
    def self.make
      [
        AbsFunction,
        AscFunction,
        ChrFunction,
        CosFunction,
        ExpFunction,
        IntFunction,
        LcaseFunction,
        LeftFunction,
        LenFunction,
        LogFunction,
        MidFunction,
        RightFunction,
        RndFunction,
        SgnFunction,
        SinFunction,
        SqrFunction,
        StrFunction,
        TabFunction,
        TanFunction,
        UcaseFunction,
        ValFunction,
      ].map(&:new)
    end

  end

end
