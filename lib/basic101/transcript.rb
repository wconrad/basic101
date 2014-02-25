module Basic101

  class Transcript

    def self.make(source_path)
      base_path = source_path.chomp('.bas')
      input_file = File.open(base_path + '.input', 'w')
      output_file = File.open(base_path + '.output', 'w')
      new(input_file, output_file)
    end

    def initialize(input_file, output_file)
      @input_file = input_file
      @output_file = output_file
    end

    def save_input(s)
      @input_file.print s
    end

    def save_output(s)
      @output_file.print s
    end

    def save_output_lines(*lines)
      lines.flatten.each do |line|
        save_output "#{line}\n"
      end
    end

    def echo?
      true
    end

  end

end
