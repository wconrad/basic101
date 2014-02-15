require_relative 'statement'

module Basic

  class StopStatement < Statement

    def execute(program)
      program.output.puts "Break in line #{@line.line_number}"
      program.end_program
    end

  end

end
