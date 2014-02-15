require_relative 'coercion_helper'

module Basic

  class BasicNumeric

    include CoercionHelper

    def self.math_op(method)
      define_method(method) do |other|
        if other.is_a?(self.class)
          self.class.new(value.public_send(method, other.value))
        else
          apply_through_coercion(other, __method__)
        end
      end
    end

    def self.comparison_op(method, op)
      define_method(method) do |other|
        b = self.compare(other).send(op, 0)
        BasicInteger.from_bool(b)
      end
    end

    math_op :+
    math_op :-
    math_op :*
    math_op :/

    def compare(other)
      if other.is_a?(self.class)
        value <=> other.value
      else
        apply_through_coercion(other, __method__)
      end
    end

    comparison_op :lt, '<'
    comparison_op :le, '<='
    comparison_op :eq, '=='
    comparison_op :ge, '>='
    comparison_op :gt, '>'
    comparison_op :ne, '!='

  end

end
