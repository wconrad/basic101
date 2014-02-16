module Basic

  class LenFunction

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      string = args.first
      string = string.eval(runtime).to_string
      string.length
    end

  end

end
