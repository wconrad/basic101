require_relative 'spec_helper'

module Basic

  describe Statement do

    let(:line_number) {10}
    let(:source) {'REM'}
    subject(:line) {Statement.new(line_number, source)}

    its(:line_number) {should eq line_number}
    its(:source) {should eq source}

    describe 'comparison' do

      context 'when equal' do
        specify do
          expect(Statement.new(10, 'REM A') <=>
                 Statement.new(10, 'REM A')).to eq 0
        end
      end

      context 'when line number less' do
        specify do
          expect(Statement.new(10, 'REM A') <=>
                 Statement.new(20, 'REM A')).to eq -1
        end
      end

      context 'when source greater' do
        specify do
          expect(Statement.new(10, 'REM B') <=>
                 Statement.new(10, 'REM A')).to eq +1
        end
      end

    end

  end

end
