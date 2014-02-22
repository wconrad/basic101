module Basic101

  class IntFunction

    def name
      'INT'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.to_float.floor
    end

  end

end
