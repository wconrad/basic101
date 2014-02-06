require_relative 'binary_math_operation'

module Basic

  class Equal

    include BinaryMathOperation

    def do_math(left, right)
      bool_to_int(left == right)
    end

  end

end
