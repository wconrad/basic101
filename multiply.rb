require_relative 'wrap_value'

module Basic

  class Multiply

    include BinaryMathOperation

    def do_math(left, right)
      result = left * right
    end

  end

end
