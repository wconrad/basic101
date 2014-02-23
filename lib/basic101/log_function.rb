module Basic101

  class LogFunction < Function

    def name
      'LOG'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      arg = args.first
      arg.eval(runtime).log
    end

  end

end
