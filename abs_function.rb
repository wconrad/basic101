module Basic

  class AbsFunction

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.abs
    end

  end

end
