# frozen_string_literal: true

module Basic101

  class UcaseFunction < Function

    def name
      'UCASE$'
    end

    def call(runtime, args)
      check_args args, [BasicString]
      value = args.first.eval(runtime)
      value.to_string.ucase
    end

  end

end
