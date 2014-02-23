module Basic101

  class SinFunction < Function

    def name
      'SIN'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.sin
    end

  end

end
