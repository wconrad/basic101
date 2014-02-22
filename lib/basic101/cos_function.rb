module Basic101

  class CosFunction

    def name
      'COS'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.cos
    end

  end

end
