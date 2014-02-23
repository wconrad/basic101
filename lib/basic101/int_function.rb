module Basic101

  class IntFunction < Function

    def name
      'INT'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.to_float.floor
    end

  end

end
