require_relative 'spec_helper'

module Basic

  describe Line do

    let(:line_number) {10}
    let(:source) {'REM'}
    subject(:line) {Line.new(line_number, source)}

    its(:line_number) {should eq line_number}
    its(:source) {should eq source}

    describe '.parse' do

      context 'when normal' do
        specify do
          expect(Line.parse('20 REM FOO')).to eq [
            Line.new(20, 'REM FOO')
          ]
        end
      end

      context 'when extra spaces' do
        specify do
          expect(Line.parse(' 20  REM FOO ')).to eq [
            Line.new(20, 'REM FOO'),
          ]
        end
      end

      context 'when line number only' do
        specify do
          expect {
            Line.parse('20')
          }.to raise_error SyntaxError, 'Syntax error: 20'
        end
      end

      context 'when missing line number' do
        specify do
          expect {
            Line.parse('REM')
          }.to raise_error SyntaxError, 'Syntax error: REM'
        end
      end

    end

  end

end
