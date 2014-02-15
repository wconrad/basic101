require_relative 'statement'

module Basic

  class ReturnStatement < Statement

    def initialize
    end

    def execute(runtime)
      runtime.return
    end

  end

end
