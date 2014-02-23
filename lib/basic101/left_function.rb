module Basic101

  class LeftFunction < Function

    def name
      'LEFT$'
    end

    def call(runtime, args)
      check_args args, [BasicString, BasicNumeric]
      string, count = *args
      string = string.eval(runtime).to_string
      count = count.eval(runtime).to_integer
      string.left(count)
    end

  end

end
