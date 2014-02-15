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

    describe 'new_line' do
      let(:rule) {parser.new_line}
      it_should_match "\n"
      it_should_match "\r\n"
    end

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

    describe 'decimal' do
      let(:rule) {parser.decimal}
      it_should_match '0'
      it_should_match '123'
    end

    describe 'sign' do
      let(:rule) {parser.sign}
      it_should_match '+'
      it_should_match '-'
    end

    describe 'integer' do
      let(:rule) {parser.integer}
      it_should_match '123'
      it_should_match '-123'
      it_should_match '+123'
    end

    describe 'float' do
      let(:rule) {parser.float}
      it_should_match '1.2'
      it_should_match '-1.2'
      it_should_match '+1.2'
    end

    describe 'line_number' do
      let(:rule) {parser.integer}
      it_should_match '10'
      it_should_match '20'
    end

    describe 'unquoted_string' do
      let(:rule) {parser.unquoted_string}
      it_should_match 'abc'
      it_should_match ''
      it_should_not_match ','
      it_should_not_match '"'
      it_should_not_match ':'
      it_should_not_match ' '
      it_should_not_match "\n"
      it_should_not_match "\r"
    end
    
    describe 'quoted_string' do
      let(:rule) {parser.quoted_string}
      it_should_match '""'
      it_should_match '"abc"'
    end

    describe 'numeric_identifier' do
      let(:rule) {parser.numeric_identifier}
      it_should_match 'A'
      it_should_match 'A1'
    end

    describe 'string_identifier' do
      let(:rule) {parser.string_identifier}
      it_should_match 'A$'
      it_should_match 'A1$'
    end

    describe 'identifier' do
      let(:rule) {parser.identifier}
      it_should_match 'A'
      it_should_match 'A$'
    end

    describe 'argument_list' do
      let(:rule) {parser.argument_list}
      it_should_match '"a"'
      it_should_match '"a", "b"'
    end

    describe 'subscript_reference' do
      let(:rule) {parser.subscript_reference}
      it_should_match 'FNA("a")'
      it_should_match 'FNA("a", "b")'
    end

    describe 'scalar_reference' do
      let(:rule) {parser.scalar_reference}
      it_should_match 'A'
      it_should_match 'S$'
    end

    describe 'reference' do
      let(:rule) {parser.reference}
      it_should_match 'A(1)'
      it_should_match 'S$'
    end

    describe 'reference_list' do
      let(:rule) {parser.reference_list}
      it_should_match 'A(1)'
      it_should_match 'I,J'
    end

    describe 'let' do
      let(:rule) {parser.let}
      it_should_match 'LET I=1'
      it_should_match 'I=1'
      it_should_match 'A(10) = 1'
      it_should_match 'A$(10) = 1'
      it_should_match 'S$ = "FOO"'
    end

    describe 'multiply_op' do
      let(:rule) {parser.multiply_op}
      it_should_match '*'
      it_should_match '/'
    end

    describe 'addition_op' do
      let(:rule) {parser.addition_op}
      it_should_match '+'
      it_should_match '-'
    end

    describe 'comparison_op' do
      let(:rule) {parser.comparison_op}
      it_should_match '='
      it_should_match '<>'
      it_should_match '>'
      it_should_match '>='
      it_should_match '<'
      it_should_match '<='
    end

    describe 'and_op' do
      let(:rule) {parser.and_op}
      it_should_match 'AND'
    end

    describe 'or_op' do
      let(:rule) {parser.or_op}
      it_should_match 'OR'
    end

    describe 'factor' do
      let(:rule) {parser.factor}
      it_should_match '"abc"'
      it_should_match '123'
      it_should_match '1.2'
      it_should_match 'TAB(10)'
      it_should_match 'A(10)'
      it_should_match 'I'
      it_should_match '(1 + 2)'
    end

    describe 'term' do
      let(:rule) {parser.term}
      it_should_match '1'
      it_should_match '1 * 2'
      it_should_match '1 * 2 / 3'
    end

    describe 'simple_expression' do
      let(:rule) {parser.simple_expression}
      it_should_match '1'
      it_should_match '1 + 2'
      it_should_match '1 + 2 - 3'
    end

    describe 'comparison_expression' do
      let(:rule) {parser.comparison_expression}
      it_should_match '1'
      it_should_match '1 > 2'
      it_should_match '1 + 2 > 2 + 3'
    end

    describe 'not_expression' do
      let(:rule) {parser.not_expression}
      it_should_match '1'
      it_should_match 'NOT 1'
    end

    describe 'and_expression' do
      let(:rule) {parser.and_expression}
      it_should_match '1'
      it_should_match '1 AND 1'
      it_should_match '1 AND 1 AND 0'
    end

    describe 'or_expression' do
      let(:rule) {parser.or_expression}
      it_should_match '1'
      it_should_match '1 OR 0'
      it_should_match '1 OR 0 OR 1'
    end

    describe 'expression' do
      let(:rule) {parser.expression}
      it_should_match 'NOT 2 * (3 + 1) + 4 > 5 AND 1 OR 0'
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

    describe 'print_arguments' do
      let(:rule) {parser.print_arguments}
      it_should_match ''
      it_should_match '"A"'
      it_should_match '"A",'
      it_should_match '"A","B"' 
      it_should_match '"A" , "B" ;'
    end

    describe 'print' do
      let(:rule) {parser.print}
      it_should_match 'PRINT'
      it_should_match 'PRINT "A"'
      it_should_match 'PRINT "A" ;'
    end

    describe 'goto' do
      let(:rule) {parser.goto}
      it_should_match 'GOTO 10'
      it_should_match 'GOTO10'
    end

    describe 'if_statement' do
      let(:rule) {parser.if_statement}
      it_should_match 'IF 1 THEN 20'
      it_should_match 'IF 1 THEN PRINT "FOO"'
    end

    describe 'randomize' do
      let(:rule) {parser.randomize}
      it_should_match 'RANDOMIZE'
    end

    describe 'input' do
      let(:rule) {parser.input}
      it_should_match 'INPUT I'
      it_should_match 'INPUT I, J'
      it_should_match 'INPUT "FOO"; A$'
    end

    describe 'end_statement' do
      let(:rule) {parser.end_statement}
      it_should_match 'END'
    end

    describe 'dim_statement' do
      let(:rule) {parser.dim_statement}
      it_should_match 'DIM A(20)'
      it_should_match 'DIM A(X, Y)'
      it_should_match 'DIM A(10), B(10)'
    end

    describe 'for_statement' do
      let(:rule) {parser.for_statement}
      it_should_match 'FOR I = 1 TO 10'
      it_should_match 'FOR I = 1 TO 10 STEP 2'
    end

    describe 'next_statement' do
      let(:rule) {parser.next_statement}
      it_should_match 'NEXT'
      it_should_match 'NEXT I'
      it_should_match 'NEXT I, J'
    end

    describe 'on_goto_statement' do
      let(:rule) {parser.on_goto_statement}
      it_should_match 'ON I GOTO 10'
      it_should_match 'ON I GOTO 10, 20'
    end

    describe 'data_item' do
      let(:rule) {parser.data_item}
      it_should_match 'abc'
      it_should_match '"abc"'
      it_should_match '123'
      it_should_match '123.45'
    end

    describe 'data_statement' do
      let(:rule) {parser.data_statement}
      it_should_match 'DATA 1'
      it_should_match 'DATA 1.23,"ABC",def'
    end

    describe 'read_statement' do
      let(:rule) {parser.read_statement}
      it_should_match 'READ I'
      it_should_match 'READ I, A(1)'
    end

    describe 'gosub_statement' do
      let(:rule) {parser.gosub_statement}
      it_should_match 'GOSUB 100'
    end

    describe 'return_statement' do
      let(:rule) {parser.return_statement}
      it_should_match 'RETURN'
    end

    describe 'stop_statement' do
      let(:rule) {parser.stop_statement}
      it_should_match 'STOP'
    end

    describe 'statement' do
      let(:rule) {parser.statement}
      it_should_match 'REM'
      it_should_match 'PRINT'
      it_should_match 'I=1'
      it_should_match 'GOTO 10'
      it_should_match 'IF 1 THEN 20'
      it_should_match 'RANDOMIZE'
      it_should_match 'INPUT I'
      it_should_match 'END'
      it_should_match 'DIM A(10)'
      it_should_match 'FOR I = 1 TO 10'
      it_should_match 'NEXT'
      it_should_match 'ON I GOTO 10, 20'
      it_should_match 'DATA 1'
      it_should_match 'READ I'
      it_should_match 'GOSUB 100'
      it_should_match 'RETURN'
      it_should_match 'STOP'
    end

    describe 'statements' do
      let(:rule) {parser.statements}
      it_should_match 'REM'
      it_should_match 'PRINT:PRINT'
      it_should_match 'PRINT : PRINT '
    end

    describe 'line' do
      let(:rule) {parser.line}
      it_should_match '10 REM'
      it_should_match '20  PRINT:PRINT'
    end

    describe 'program' do
      let(:rule) {parser.program}
      it_should_match ""
      it_should_match "10 REM\n"
      it_should_match "10 REM\n20 PRINT\n"
    end

  end

end
