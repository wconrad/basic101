module Basic101

  class MidFunction

    def name
      'MID$'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless (2..3).include?(args.size)
      string, start, count = *args
      string = string.eval(runtime).to_string
      start = start.eval(runtime).to_integer
      count = count && count.eval(runtime).to_integer
      string.mid(start, *[count])
    end

  end

end
