module Basic101

  class TanFunction < Function

    def name
      'TAN'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.tan
    end

  end

end
