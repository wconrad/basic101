module Basic101

  class ChrFunction < Function

    def name
      'CHR$'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      value = args.first.eval(runtime)
      value.to_integer.chr
    end

  end

end
