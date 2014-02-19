module Basic

  class SinFunction

    def name
      'SIN'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.sin
    end

  end

end
