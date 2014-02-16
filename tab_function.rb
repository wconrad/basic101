module Basic

  class TabFunction

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      column = args.first.eval(runtime).to_i
      Tab.new(column)
    end

  end

end
