require_relative 'spec_helper'

module Basic

  describe Output do

    let(:file) {StringIO.new}
    subject(:output) {described_class.new(file)}

    describe '#print_string' do
      specify do
        output.print_string 'abc'
        expect(file.string).to eq 'abc'
      end
    end

    describe '#print_new_line' do
      specify do
        output.print_new_line
        expect(file.string).to eq "\n"
      end
    end

    describe '#print_tab' do
      specify do
        output.print_tab
        expect(file.string).to eq "\t"
      end
    end

  end

end
