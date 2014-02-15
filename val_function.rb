module Basic

  class ValFunction

    include WrapValue

    def call(program, args)
      raise InvalidArgumentError unless args.size == 1
      value = args.first.eval(program).to_s.to_f
      wrap_value(value)
    end

  end

end
