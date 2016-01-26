# frozen_string_literal: true

module Basic101

  class SgnFunction < Function

    def name
      'SGN'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.sgn
    end

  end

end
