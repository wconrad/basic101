module Basic

  class ForStack

    def initialize
      @stack = []
    end

    def empty?
      @stack.empty?
    end

    def push(statement)
      if has_reference?(statement.reference)
        raise DuplicateReferenceInForStack
      end
      @stack.push statement
    end

    def pop
      @stack.pop
    end

    def top
      @stack.last
    end

    def delete_reference(reference)
      @stack.reject! do |statement|
        statement.reference == reference
      end
    end

    def [](reference)
      @stack.find do |statement|
        statement.reference == reference
      end
    end

    private

    def has_reference?(reference)
      !!self[reference]
    end

  end

end
