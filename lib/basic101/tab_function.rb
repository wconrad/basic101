module Basic101

  class TabFunction < Function

    def name
      'TAB'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      column = args.first.eval(runtime).to_i
      Tab.new(column)
    end

  end

end
