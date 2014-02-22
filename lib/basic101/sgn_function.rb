module Basic101

  class SgnFunction

    def name
      'SGN'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.sgn
    end

  end

end
