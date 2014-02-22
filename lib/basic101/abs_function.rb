module Basic101

  class AbsFunction

    def name
      'ABS'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.abs
    end

  end

end
