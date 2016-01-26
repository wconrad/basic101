# frozen_string_literal: true

module Basic101

  class Function

    def check_args(args, required_types, optional_types = [])
      ArgumentChecker.new(args, required_types, optional_types).check
    end

  end

end
