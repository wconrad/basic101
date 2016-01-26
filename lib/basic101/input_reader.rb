# frozen_string_literal: true

module Basic101

  class InputReader

    def initialize(input)
      line = input.read_line
      line += ',' unless line.empty?
      line += EOS
      @columns = line.parse_csv
    rescue CSV::MalformedCSVError => e
      raise BadInputFormatError, 'Invalid format'
    end

    def read_string
      end_of_input_error if @columns.empty?
      value = @columns.shift
      if value == EOS
        ''
      else
        value || ''
      end
    end

    def read_numeric
      column = next_column
      unless column =~ /^[+-]?\d+/
        raise BadInputFormatError, "Not numeric: #{column.inspect}"
      end
      column.to_f
    end

    private

    def next_column
      raise_error_if_eos
      @columns.shift || ''
    end

    def raise_error_if_eos
      if @columns.first == EOS
        end_of_input_error
      end
    end

    private

    EOS = "EOS"

    def end_of_input_error
      raise TooFewInputItemsError, "Too few items"
    end

  end

end
