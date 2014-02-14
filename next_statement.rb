require_relative 'statement'

module Basic

  class NextStatement < Statement

    attr_writer :for_statement

    def initialize(reference)
      @reference = reference
    end

    def execute(runtime) 
      @for_statement.repeat(runtime, @reference)
    end

    def goto_following_statement(runtime)
      runtime.goto_index_after(@index)
    end

    protected

    def state
      @reference
    end

  end

end
