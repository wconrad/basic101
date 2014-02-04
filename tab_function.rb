module Basic

  class TabFunction

    def call(program, args)
      raise IllegalFunctionCall unless args.size == 1
      column = args.first.eval(program).to_i
      Tab.new(column)
    end

  end

end
