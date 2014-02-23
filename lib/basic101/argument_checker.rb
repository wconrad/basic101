module Basic101

  class ArgumentChecker

    def initialize(args, required_types, optional_types)
      @args = args
      @required_types = required_types
      @optional_types = optional_types
    end

    def check
      check_count
      check_types
    end

    private

    def check_count
      unless count_range.include?(@args.size)
        message = "Wrong number of arguments "\
        "(#{@args.size} instead of #{expected_count})"
        raise InvalidArgumentError, message
      end
    end

    def check_types
      @args.zip(types[0..@args.size]).each do |arg, type|
        unless arg.is_a?(type)
          raise InvalidArgumentError,
          "Expected #{type.type_name} but got #{arg.type_name}"
        end
      end
    end

    def expected_count
      if min_count == max_count
        min_count
      else
        count_range
      end
    end

    def count_range
      min_count..max_count
    end

    def min_count
      @required_types.size
    end

    def max_count
      types.size
    end

    def types
      @required_types + @optional_types
    end

  end

end
