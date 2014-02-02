require_relative 'spec_helper'

module Basic

  describe Line do

    describe '.parse' do

      subject(:line) {Line.new(source_line)}

      context 'single statement' do
        let(:source_line) {'20 REM FOO'}
        specify do
          expect(line.statements).to eq [
            RemarkStatement.new(20)
          ]
        end
      end

      context 'when line number only' do
        let(:source_line) {'20'}
        specify do
          expect {
            line.statements
          }.to raise_error Parslet::ParseFailed
        end
      end

      context 'when missing line number' do
        let(:source_line) {'REM'}
        specify do
          expect {
            line.statements
          }.to raise_error Parslet::ParseFailed
        end
      end

    end

  end

end
