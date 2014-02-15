require_relative 'statement'

module Basic

  class DataStatement < Statement

    attr_reader :data_items

    def initialize(data_items)
      @data_items = data_items
    end

    def execute(runtime)
    end

    protected

    def state
      @data_items
    end

  end

end
