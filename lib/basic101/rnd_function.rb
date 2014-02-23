module Basic101

  class RndFunction < Function

    def initialize
      @rand = 0
    end

    def name
      'RND'
    end

    def call(runtime, args)
      check_args args, [BasicNumeric]
      new_number = args.first.eval(runtime).to_f > 0
      if new_number
        @rand = runtime.rand
      end
      BasicFloat.new(@rand)
    end

  end

end
