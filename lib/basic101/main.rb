# frozen_string_literal: true

module Basic101

  class Main

    def initialize(argv)
      @args = Arguments.new(argv)
    end

    def run
      program = Program.load(ARGF)
      runtime = Runtime.new(:program => program)
      if @args.transcript
        runtime.transcript = Transcript.make(@args.filenames.first)
      end
      runtime.randomize if @args.randomize
      runtime.run
    rescue NoMoreInputError => e
      puts
      abort e.message
    rescue Interrupt => e
      puts
      abort "Interrupt"
    rescue Error => e
      abort e.to_s
    end

  end

end
