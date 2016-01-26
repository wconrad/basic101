# frozen_string_literal: true

module Basic101

  module BasicMath

    def self.basic_math_op(method)
      define_method(method) do |other|
        a = to_float.to_f
        b = other.to_float.to_f
        result = a.send(method, b)
        BasicFloat.new(result).simplest
      end
    end

    basic_math_op :*
    basic_math_op :/
    basic_math_op :+
    basic_math_op :-
    basic_math_op :**

  end

end
