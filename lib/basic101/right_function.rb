module Basic101

  class RightFunction < Function

    def name
      'RIGHT$'
    end

    def call(runtime, args)
      check_args args, [BasicString, BasicNumeric]
      string, count = *args
      string = string.eval(runtime).to_string
      count = count.eval(runtime).to_integer
      string.right(count)
    end

  end

end
