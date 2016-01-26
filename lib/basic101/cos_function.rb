# frozen_string_literal: true

module Basic101

  class CosFunction < Function

    def name
      'COS'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.cos
    end

  end

end
