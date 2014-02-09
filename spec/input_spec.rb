require_relative 'spec_helper'

module Basic

  describe Input do

    let(:file) {StringIO.new(input_string)}
    subject(:input) {described_class.new(file)}

    describe '#read_line' do

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

  end

end
