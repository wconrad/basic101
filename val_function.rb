module Basic

  class ValFunction

    include WrapValue

    def call(runtime, args)
      raise InvalidArgumentError unless args.size == 1
      value = args.first.eval(runtime).to_s.to_f
      wrap_value(value)
    end

  end

end
