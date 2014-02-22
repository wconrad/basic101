module Basic101

  class ValFunction

    def name
      'VAL'
    end

    def call(runtime, args)
      raise InvalidArgumentError unless args.size == 1
      args.first.eval(runtime).val
    end

  end

end
