require_relative 'spec_helper'

module Basic

  describe Parser do

    def self.it_should_match(s, expected_parse_tree = nil)
      it "should consume #{s.inspect}" do
        if expected_parse_tree
          expect(rule.parse(s)).to eq expected_parse_tree
        else
          expect {rule.parse(s)}.to_not raise_error
        end
      end
    end

    def self.it_should_not_match(s)
      it "should consume #{s.inspect}" do
        expect{rule.parse(s)}.to raise_error Parslet::ParseFailed
      end
    end

    let(:parser) {Parser.new}

    describe 'space' do
      let(:rule) {parser.space}
      it_should_not_match ''
      it_should_match ' '
      it_should_match '  '
    end

    describe 'space?' do
      let(:rule) {parser.space?}
      it_should_match ''
      it_should_match ' '
    end

    describe 'printable' do
      let(:rule) {parser.printable}
      it_should_not_match "\x1f"
      it_should_match "\x20"
      it_should_match "\x7e"
      it_should_not_match "\x7f"
    end

    describe 'integer' do
      let(:rule) {parser.integer}
      it_should_match '10'
    end
    
    describe 'string' do
      let(:rule) {parser.string}
      it_should_match '""'
      it_should_match '"abc"'
    end
    
    describe 'expression' do
      let(:rule) {parser.expression}
      it_should_match '"abc"'
    end

    describe 'remark' do
      let(:rule) {parser.remark}
      it_should_match 'REM'
      it_should_match 'REM THIS IS A REMARK'
    end

    describe 'print_separator' do
      let(:rule) {parser.print_separator}
      it_should_match ';'
      it_should_match ','
    end

    describe 'print' do
      let(:rule) {parser.print}
      it_should_match 'PRINT'
      it_should_match 'PRINT "A"'
    end

    describe 'statement' do
      let(:rule) {parser.statement}
      it_should_match 'REM'
      it_should_match 'PRINT'
      it_should_match 'PRINT '
    end

    describe 'statements' do
      let(:rule) {parser.statements}
      it_should_match 'REM'
      it_should_match 'PRINT:PRINT'
      it_should_match 'PRINT : PRINT'
    end

    describe 'line' do
      let(:rule) {parser.line}
      it_should_match '10 REM'
      it_should_match '20 PRINT:PRINT'
    end

  end

end
