require_relative 'binary_math_operation'

module Basic

  class Divide

    include BinaryMathOperation

    def do_math(left, right)
      result = left / right
    end

  end

end
