# frozen_string_literal: true

require_relative 'function'

module Basic101

  class AbsFunction < Function

    def name
      'ABS'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.abs
    end

  end

end
