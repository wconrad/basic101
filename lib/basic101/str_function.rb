module Basic101

  class StrFunction

    def name
      'STR$'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      args.first.eval(runtime).str
    end

  end

end
