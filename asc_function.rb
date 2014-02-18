module Basic

  class AscFunction

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.to_string.asc
    end

  end

end
