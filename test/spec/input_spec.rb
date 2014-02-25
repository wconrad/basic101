require_relative 'spec_helper'

module Basic101

  describe Input do

    let(:output_isatty) {true}
    let(:input_isatty) {true}
    let(:file) {StringIO.new(input_string)}
    let(:output) {double Output, :isatty => output_isatty}
    subject(:input) {described_class.new(output, file)}
    before(:each) {file.stub(:isatty => input_isatty)}

    describe 'transcript' do

      let(:input_string) {"abc\n"}
      let(:input_file) {StringIO.new}
      let(:output_file) {StringIO.new}
      let(:transcript) {Transcript.new(input_file, output_file)}

      it 'should echo to the transcript' do
        input.transcript = transcript
        input.read_line
        expect(input_file.string).to eq input_string
      end

    end

    describe '#read_line' do

      describe 'output' do

        context 'when normal' do
          let(:input_string) {"abc\ndef\n"}
          specify do
            expect(input.read_line).to eq "abc"
            expect(input.read_line).to eq "def"
            expect {
              input.read_line
            }.to raise_error NoMoreInputError, "No more input"
          end
        end

        context 'when no terminating new-line' do
          let(:input_string) {"abc"}
          specify do
            expect(input.read_line).to eq "abc"
            expect {
              input.read_line
            }.to raise_error NoMoreInputError, "No more input"
          end
        end

      end

      describe 'echo' do

        let(:input_string) {"abc\n"}

        context 'when input is not tty and output is not tty' do
          let(:input_isatty) {false}
          let(:output_isatty) {false}
          specify do
            output.should receive(:echo).with(input_string)
            input.read_line
          end
        end

        context 'when input is not tty and output is tty' do
          let(:input_isatty) {false}
          let(:output_isatty) {true}
          specify do
            output.should receive(:echo).with(input_string)
            input.read_line
          end
        end

        context 'when input is tty and output is not tty' do
          let(:input_isatty) {true}
          let(:output_isatty) {false}
          specify do
            output.should receive(:echo).with(input_string)
            input.read_line
          end
        end

        context 'when input is tty and output is tty' do
          let(:input_isatty) {true}
          let(:output_isatty) {true}
          specify do
            output.should_not receive(:print)
            input.read_line
          end
        end

      end

    end

  end

end
