require_relative 'statement'

module Basic101

  class ForStatement < Statement

    # attr_writer :next_statement
    attr_reader :reference

    def initialize(reference, from, to, step)
      @reference = reference
      @from = from
      @to = to
      @step = step || BasicInteger.new(1)
    end

    def execute(runtime)
      delete_from_stack(runtime)
      runtime.for_stack.push self
      from = @from.eval(runtime)
      @reference.assign(runtime, from)
    end

    def increment(runtime)
      step = @step.eval(runtime)
      counter = @reference.eval(runtime)
      @reference.assign(runtime, counter + step)
    end

    def done?(runtime)
      step = @step.eval(runtime)
      counter = @reference.eval(runtime)
      to = @to.eval(runtime)
      if step.value < 0
        counter.lt(to)
      else
        counter.gt(to)
      end.to_b
    end

    def goto_following_statement(runtime)
      runtime.goto_index_after @index
    end

    def delete_from_stack(runtime)
      runtime.for_stack.delete_reference(@reference)
    end

    protected

    def state
      [@reference, @from, @to, @step]
    end

  end

end
