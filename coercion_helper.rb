module Basic

  # Cribbed from Ruby's matrix library

  module CoercionHelper

    def apply_through_coercion(other, method)
      a, b = other.coerce(self)
      a.public_send(method, b)
    end

    def coercion_failed(a, b)
      raise TypeError, "#{a.class} can't be coerced into #{b.class}"
    end

  end

end
