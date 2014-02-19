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
    math_op :**

    def compare(other)
      if other.is_a?(self.class)
        value <=> other.value
      else
        apply_through_coercion(other, __method__)
      end
    end

    def negate
      self.class.new(-value)
    end

    def print_string(output)
      s = format + ' '
      s = ' ' + s unless s =~ /^-/
      output.print s
    end

    def print_new_line(output)
      output.print "\n"
    end

    def abs
      self.class.new(@value.abs)
    end

    def sqr
      BasicFloat.new(@value ** 0.5).simplest
    end

    def exp
      BasicFloat.new(Math::E ** value).simplest
    end

  end

end
