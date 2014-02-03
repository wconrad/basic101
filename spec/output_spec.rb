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

  end

end
