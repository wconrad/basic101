require_relative 'spec_helper'

module Basic

  describe Output do

    let(:file) {StringIO.new}
    subject(:output) {described_class.new(file)}

    context 'string' do
      specify do
        output.print 'abc'
        expect(file.string).to eq 'abc'
      end
    end

    context 'new line' do
      specify do
        output.print "\n"
        expect(file.string).to eq "\n"
      end
    end

    context 'tab' do
      specify do
        output.print "\t"
        expect(file.string).to eq "\t"
      end
    end

  end

end
