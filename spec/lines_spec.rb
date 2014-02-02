require_relative 'spec_helper'

module Basic

  describe Lines do

    let(:line1) {Line.new(10, 'REM a')}
    let(:line2) {Line.new(20, 'REM b')}
    let(:line3) {Line.new(nil, 'REM c')}

    subject(:lines) {described_class.new}

    before(:each) do
      lines << line1
      lines << line2
      lines << line3
    end

    describe '#lines' do
      specify do
        expect(lines.lines).to eq [line1, line2, line3]
      end
    end

    describe '#[]' do
      specify do
        expect(lines[0]).to eq line1
        expect(lines[1]).to eq line2
        expect(lines[2]).to eq line3
        expect(lines[3]).to be_nil
      end
    end

    describe '#index_of' do
      specify do
        expect(lines.index_of(10)).to eq 0
        expect(lines.index_of(20)).to eq 1
        expect {
          lines.index_of(30)
        }.to raise_error(UndefinedLineNumberError,
                         "Undefined line number 30")
      end
    end

  end

end
