require_relative 'statement'

module Basic

  class StopStatement < Statement

    def execute(runtime)
      runtime.output.puts "Break in line #{@line.line_number}"
      runtime.end_program
    end

  end

end
