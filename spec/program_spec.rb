require_relative 'spec_helper'

module Basic

  describe Program do

    let(:statement1) {double Statement}
    let(:statement2) {double Statement}
    let(:statement3) {double Statement}
    let(:statements) {[statement1, statement2, statement3]}
    let(:line1) {Line.new(10, [statement1])}
    let(:line2) {Line.new(20, [statement2, statement3])}
    let(:lines) {[line1, line2]}

    subject(:program) {described_class.new(lines)}

    describe '#lines' do
      specify do
        expect(program.statements).to eq statements
      end
    end

    describe '#[]' do
      specify do
        expect(program[0]).to eq statement1
        expect(program[1]).to eq statement2
        expect(program[2]).to eq statement3
        expect(program[3]).to be_nil
      end
    end

    describe '#index_of' do
      specify do
        expect(program.index_of(10)).to eq 0
        expect(program.index_of(20)).to eq 1
        expect {
          program.index_of(30)
        }.to raise_error(UndefinedLineNumberError,
                         "Undefined line number 30")
      end
    end

  end

end
