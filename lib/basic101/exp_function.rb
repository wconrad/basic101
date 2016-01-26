# frozen_string_literal: true

module Basic101

  class ExpFunction < Function

    def name
      'EXP'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.exp
    end

  end

end
