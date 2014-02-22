module Basic101

  class RightFunction

    def name
      'RIGHT$'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 2
      string, count = *args
      string = string.eval(runtime).to_string
      count = count.eval(runtime).to_integer
      string.right(count)
    end

  end

end
