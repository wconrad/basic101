# frozen_string_literal: true

module Basic101

  class LenFunction < Function

    def name
      'LEN'
    end

    def call(runtime, args)
      check_args args, [BasicString]
      string = args.first
      string = string.eval(runtime).to_string
      string.length
    end

  end

end
