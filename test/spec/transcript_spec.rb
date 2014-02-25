require_relative 'spec_helper'

module Basic101

  describe Transcript do

    let(:path) {'/tmp/foo.bas'}
    let(:input_file) {StringIO.new}
    let(:output_file) {StringIO.new}
    subject {Transcript.new(input_file, output_file)}

    context 'nothing written' do
      specify do
        expect(input_file.string).to eq ''
        expect(output_file.string).to eq ''
      end
    end

    context 'output written' do
      specify do
        subject.save_output 'abc'
        expect(input_file.string).to eq ''
        expect(output_file.string).to eq 'abc'
      end
    end

    context 'input written' do
      specify do
        subject.save_input 'abc'
        expect(input_file.string).to eq 'abc'
        expect(output_file.string).to eq ''
      end
    end

  end

end
