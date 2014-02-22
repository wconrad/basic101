require_relative 'statement'

module Basic101

  class NextStatement < Statement

    def initialize(reference)
      @reference = reference
    end

    def execute(runtime) 
      for_statement = if @reference.nil?
                        runtime.for_stack.top
                      else
                        runtime.for_stack[@reference]
                      end
      raise NextWithoutFor unless for_statement
      for_statement.increment(runtime)
      if for_statement.done?(runtime)
        for_statement.delete_from_stack(runtime)
      else
        for_statement.goto_following_statement(runtime)
      end
    end

    protected

    def state
      @reference
    end

  end

end
