# frozen_string_literal: true

module Basic101

  class LcaseFunction < Function

    def name
      'LCASE$'
    end

    def call(runtime, args)
      check_args args, [BasicString]
      value = args.first.eval(runtime)
      value.to_string.lcase
    end

  end

end
