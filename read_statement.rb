require_relative 'statement'

module Basic

  class ReadStatement < Statement

    def initialize(references)
      @references = references
    end

    def execute(runtime)
      @references.each do |reference|
        reference.assign(runtime, runtime.get_data_item)
      end
    end

    protected

    def state
      @references
    end

  end

end
