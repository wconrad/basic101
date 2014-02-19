module Basic

  class TanFunction

    def name
      'TAN'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.tan
    end

  end

end
