# frozen_string_literal: true

module Basic101

  class MidFunction < Function

    def name
      'MID$'
    end

    def call(runtime, args)
      check_args args, [BasicString, BasicNumeric], [BasicNumeric]
      string, start, count = *args
      string = string.eval(runtime).to_string
      start = start.eval(runtime).to_integer
      count = count && count.eval(runtime).to_integer
      string.mid(start, *[count])
    end

  end

end
