require_relative 'statement'

module Basic

  class ForStatement < Statement

    include WrapValue

    attr_writer :next_statement

    def initialize(reference, from, to, step)
      @reference = reference
      @from = from
      @to = to
      @step = step || BasicInteger.new(1)
      @active = false
    end

    def execute(runtime)
      raise ForNextSequenceError if @active
      @active = true
      @final = @to.eval(runtime)
      @reference.assign(runtime, @from.eval(runtime))
      goto_appropriate_statement(runtime)
    end

    def repeat(runtime, next_reference)
      raise ForNextSequenceError unless @active
      if next_reference
        raise ForNextSequenceError unless next_reference == @reference
      end
      increment_value(runtime)
      goto_appropriate_statement(runtime)
    end

    protected

    def state
      [@reference, @from, @to, @step]
    end

    private

    def goto_appropriate_statement(runtime)
      if done?(runtime)
        @active = false
        @next_statement.goto_following_statement(runtime)
      else
        runtime.goto_index_after(@index)
      end
    end

    def done?(runtime)
      step = @step.eval(runtime).value
      if step < 0
        @reference.eval(runtime).value < @final.value
      else
        @reference.eval(runtime).value > @final.value
      end
    end

    def increment_value(runtime)
      step = @step.eval(runtime).value
      value = @reference.eval(runtime).value
      value += step
      @reference.assign(runtime, wrap_value(value))
    end

  end

end
