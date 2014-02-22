require_relative 'statement'

module Basic101

  class ReturnStatement < Statement

    def initialize
    end

    def execute(runtime)
      runtime.return
    end

  end

end
