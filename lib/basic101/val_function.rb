module Basic101

  class ValFunction < Function

    def name
      'VAL'
    end

    def call(runtime, args)
      check_args args, [BasicString]
      args.first.eval(runtime).val
    end

  end

end
