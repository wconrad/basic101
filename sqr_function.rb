module Basic

  class SqrFunction

    def name
      'SQR'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.sqr
    end

  end

end
