module Basic

  class LogFunction

    def name
      'LOG'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      arg = args.first
      arg.eval(runtime).log
    end

  end

end
