module Basic

  class StrFunction

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      args.first.eval(runtime).str
    end

  end

end
