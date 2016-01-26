# frozen_string_literal: true

module Basic101

  class AscFunction < Function

    def name
      'ASC'
    end

    def call(runtime, args)
      check_args args, [BasicString]
      value = args.first.eval(runtime)
      value.to_string.asc
    end

  end

end
