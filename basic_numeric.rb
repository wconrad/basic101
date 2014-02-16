require_relative 'coercion_helper'
require_relative 'comparison_methods'

module Basic

  class BasicNumeric

    include ComparisonMethods
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

  end

end
