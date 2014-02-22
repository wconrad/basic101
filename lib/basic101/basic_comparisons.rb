module Basic101

  module BasicComparisons

    def self.comparison_op(method, op)
      define_method(method) do |other|
        BasicInteger.from_bool(self.send(op, other))
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
