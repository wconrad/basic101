# frozen_string_literal: true

module Basic101

  class StrFunction < Function

    def name
      'STR$'
    end

    def call(runtime, args)
      check_args args, [BasicObject]
      args.first.eval(runtime).str
    end

  end

end
