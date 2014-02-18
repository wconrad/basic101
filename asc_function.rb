module Basic

  class AscFunction

    def name
      'ASC'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      value = args.first.eval(runtime)
      value.to_string.asc
    end

  end

end
