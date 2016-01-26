# frozen_string_literal: true

module Basic101

  class ScalarReference < Reference

    def eval(runtime)
      if runtime.function_exists?(@identifier)
        runtime.call_function(@identifier, [])
      else
        runtime.get_scalar(@identifier)
      end
    end

    def assign(runtime, value)
      runtime.set_scalar(@identifier, value)
    end

  end

end
