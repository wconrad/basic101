# frozen_string_literal: true

module Basic101

  class SqrFunction < Function

    def name
      'SQR'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.sqr
    end

  end

end
