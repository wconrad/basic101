module Basic

  module ComparisonMethods

    def self.comparison_op(method, op)
      define_method(method) do |other|
        b = self.compare(other).send(op, 0)
        BasicInteger.from_bool(b)
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
