module Basic101

  class ExpFunction

    def name
      'EXP'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.exp
    end

  end

end
