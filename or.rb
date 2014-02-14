require_relative 'binary_logic_operation'

module Basic

  class Or

    include BinaryLogicOperation

    def do_operation(left, right)
      left || right
    end

  end

end
