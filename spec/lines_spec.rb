require_relative 'spec_helper'

module Basic

  describe Lines do

    subject(:lines) {described_class.new}

    describe '#to_a' do

      context 'when adding lines out of order' do
        specify do
          line1 = Line.new(10, "REM FIRST LINE")
          line2 = Line.new(20, "REM SECOND LINE")
          line3 = Line.new(30, "REM THIRD LINE")
          lines << line1
          lines << line3
          lines << line2
          expect(lines.to_a).to eq [line1, line2, line3]
        end
      end

      context 'when no lines' do
        specify do
          expect(lines.to_a).to be_empty
        end
      end

      context 'when overwriting a line' do
        specify do
          line1 = Line.new(10, "REM ORIGINAL")
          line2 = Line.new(10, "REM REWRITTEN")
          lines << line1
          lines << line2
          expect(lines.to_a).to eq [line2]
        end
      end

    end

    describe '#from_line' do

      context 'when line does not exist' do
        specify do
          expect {
            lines.from_line(10)
          }.to raise_error UndefinedLineNumberError, "Undefined line number: 10"
        end
      end

      context 'when line exists' do
        specify do
          line1 = Line.new(10, "REM FIRST LINE")
          line2 = Line.new(20, "REM SECOND LINE")
          line3 = Line.new(30, "REM THIRD LINE")
          lines << line1
          lines << line3
          lines << line2
          expect(lines.from_line(20).to_a).to eq [line2, line3]
        end
      end

    end

  end

end
