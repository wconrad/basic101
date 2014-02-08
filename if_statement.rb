require_relative 'statement'

module Basic

  class IfStatement < Statement

    def initialize(condition, true_target)
      @condition = condition
      @true_target = true_target
    end

    def execute(program)
      if @condition.eval(program).to_f != 0
        program.goto(@true_target.eval(program).to_i)
      end
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      self.state == other.state
    end

    protected

    def state
      [@condition, @true_target]
    end

  end

end
