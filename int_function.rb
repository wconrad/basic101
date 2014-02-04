module Basic

  class IntFunction

    def call(program, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(program).to_f.floor
      BasicInteger.new(value)
    end

  end

end
