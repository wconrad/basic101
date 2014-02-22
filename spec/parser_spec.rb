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
      it "should not consume #{s.inspect}" do
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
      it_should_match '  '
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

    describe 'fixed' do
      let(:rule) {parser.float}
      it_should_match '.2'
      it_should_match '1.2'
      it_should_match '-1.2'
      it_should_match '+1.2'
      it_should_not_match '1'
    end

    describe 'exponent' do
      let(:rule) {parser.exponent}
      it_should_match 'E10'
      it_should_match 'E-10'
      it_should_match 'E+10'
    end

    describe 'float' do
      let(:rule) {parser.float}
      it_should_match '1.2'
      it_should_match '1E10'
      it_should_match '1E+10'
      it_should_match '1E-10'
      it_should_not_match '1'
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
      it_should_not_match %Q'"\n"'
    end

    describe 'built_in_function_identifier' do
      let(:rule) {parser.built_in_function_identifier}
      it_should_match 'LEN'
      it_should_match 'RIGHT$'
    end

    describe 'base_identifier' do
      let(:rule) {parser.base_identifier}
      it_should_match 'A'
      it_should_match 'A1'
      it_should_not_match 'ELSE'
    end

    describe 'user_defined_function_identifier' do
      let(:rule) {parser.user_defined_function_identifier}
      it_should_match 'FNA'
      it_should_match 'FNB1'
      it_should_match 'FNS$'
    end

    describe 'built_in_function_identifier' do
      let(:rule) {parser.built_in_function_identifier}
      it_should_match 'ABS'
      it_should_match 'ASC'
      it_should_match 'CHR$'
      it_should_match 'COS'
      it_should_match 'EXP'
      it_should_match 'INT'
      it_should_match 'LEFT$'
      it_should_match 'LEN'
      it_should_match 'LOG'
      it_should_match 'MID$'
      it_should_match 'RIGHT$'
      it_should_match 'RND'
      it_should_match 'SGN'
      it_should_match 'SIN'
      it_should_match 'SQR'
      it_should_match 'STR$'
      it_should_match 'TAB'
      it_should_match 'TAN'
      it_should_match 'VAL'
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
      it_should_match '"a" , "b"'
      it_should_match '"a","b"'
    end

    describe 'subscript_reference' do
      let(:rule) {parser.subscript_reference}
      it_should_match 'FNA("a")'
      it_should_match 'FNA ( "a", "b" )'
      it_should_match 'FNA("a","b")'
    end

    describe 'scalar_reference' do
      let(:rule) {parser.scalar_reference}
      it_should_match 'A'
      it_should_match 'S$'
    end

    describe 'scalar_reference_list' do
      let(:rule) {parser.scalar_reference_list}
      it_should_match 'I'
      it_should_match 'I , J'
      it_should_match 'I,J'
    end

    describe 'reference' do
      let(:rule) {parser.reference}
      it_should_match 'A ( 1 )'
      it_should_match 'A(1)'
      it_should_match 'S$'
    end

    describe 'reference_list' do
      let(:rule) {parser.reference_list}
      it_should_match 'A(1)'
      it_should_match 'I,J'
    end

    describe 'let_statement' do
      let(:rule) {parser.let_statement}
      it_should_match 'LET I = 1'
      it_should_match 'LETI=1'
      it_should_match 'I = 1'
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
      it_should_match '1.2'
      it_should_match '123'
      it_should_match 'I'
      it_should_match '( 1 + 2 )'
      it_should_match '(1+2)'
    end

    describe 'power' do
      let(:rule) {parser.power}
      it_should_match '1^2'
      it_should_match '1^2^3'
      it_should_match 'I'
    end

    describe 'negation' do
      let(:rule) {parser.negation}
      it_should_match '-I'
      it_should_match 'I'
    end

    describe 'term' do
      let(:rule) {parser.term}
      it_should_match '1'
      it_should_match '1 * 2'
      it_should_match '1 * 2 / 3'
      it_should_match '1*2/3'
    end

    describe 'simple_expression' do
      let(:rule) {parser.simple_expression}
      it_should_match '1'
      it_should_match '1 + 2'
      it_should_match '1 + 2 - 3'
      it_should_match '1+2-3'
    end

    describe 'comparison_expression' do
      let(:rule) {parser.comparison_expression}
      it_should_match '1'
      it_should_match '1 > 2'
      it_should_match '1 + 2 > 2 + 3'
      it_should_match '1+2>2+3'
    end

    describe 'not_expression' do
      let(:rule) {parser.not_expression}
      it_should_match '1'
      it_should_match 'NOT 1'
      it_should_match 'NOT1'
    end

    describe 'and_expression' do
      let(:rule) {parser.and_expression}
      it_should_match '1'
      it_should_match '1 AND 1'
      it_should_match '1 AND 1 AND 0'
      it_should_match '1AND1AND0'
    end

    describe 'or_expression' do
      let(:rule) {parser.or_expression}
      it_should_match '1'
      it_should_match '1 OR 0'
      it_should_match '1 OR 0 OR 1'
      it_should_match '1OR0OR1'
    end

    describe 'expression' do
      let(:rule) {parser.expression}
      it_should_match 'NOT 2 * (3 + 1) + 4 > 5 AND 1 OR 0'
      it_should_match 'NOT2*(3+1)+4>5AND1OR0'
    end

    describe 'remark_statement' do
      let(:rule) {parser.remark_statement}
      it_should_match 'REM'
      it_should_match 'REM THIS IS A REMARK'
      it_should_match 'REMTHISISAREMARK'
    end

    describe 'print_separator' do
      let(:rule) {parser.print_separator}
      it_should_match ';'
      it_should_match ','
    end

    describe 'print_statement' do
      let(:rule) {parser.print_statement}
      it_should_match 'PRINT'
      it_should_match 'PRINT "A"'
      it_should_match 'PRINT "A" ;'
      it_should_match 'PRINT "A", 1'
      it_should_match 'PRINT "A", 1 ;'
      it_should_match 'PRINT1,"A";'
      it_should_not_match 'PRINT "ok" ELSE'
    end

    describe 'goto_statement' do
      let(:rule) {parser.goto_statement}
      it_should_match 'GOTO 10'
      it_should_match 'GOTO10'
    end

    describe 'if_block' do
      let(:rule) {parser.if_block}
      it_should_match '123'
      it_should_match 'GOTO 10'
      it_should_match 'PRINT:PRINT'
    end

    describe 'if_statement' do
      let(:rule) {parser.if_statement}
      it_should_match 'IF 1 THEN 20'
      it_should_match 'IF 1 THEN PRINT "FOO"'
      it_should_match 'IF 1 THEN PRINT "FOO" ELSE PRINT "BAR"'
      it_should_match 'IF1THENPRINT"FOO"ELSEPRINT"BAR"'
    end

    describe 'randomize_statement' do
      let(:rule) {parser.randomize_statement}
      it_should_match 'RANDOMIZE'
    end

    describe 'prompt_delimeter' do
      let(:rule) {parser.prompt_delimeter}
      it_should_match ','
      it_should_match ';'
    end

    describe 'input_statement' do
      let(:rule) {parser.input_statement}
      it_should_match 'INPUT I'
      it_should_match 'INPUT I, J'
      it_should_match 'INPUT "FOO", A$'
      it_should_match 'INPUT "FOO" ; A$'
      it_should_match 'INPUT"FOO";A$'
    end

    describe 'end_statement' do
      let(:rule) {parser.end_statement}
      it_should_match 'END'
    end

    describe 'dim_statement' do
      let(:rule) {parser.dim_statement}
      it_should_match 'DIM A(20)'
      it_should_match 'DIM A(X, Y)'
      it_should_match 'DIM A ( 10 ), B ( 10 )'
      it_should_match 'DIMA(10),B(10)'
    end

    describe 'for_statement' do
      let(:rule) {parser.for_statement}
      it_should_match 'FOR I = 1 TO 10'
      it_should_match 'FOR I = 1 TO 10 STEP 2'
      it_should_match 'FORI=1TO10STEP-2'
    end

    describe 'next_statement' do
      let(:rule) {parser.next_statement}
      it_should_match 'NEXT'
      it_should_match 'NEXT I'
      it_should_match 'NEXT I, J'
      it_should_match 'NEXTI,J'
    end

    describe 'on_goto_statement' do
      let(:rule) {parser.on_goto_statement}
      it_should_match 'ON I GOTO 10'
      it_should_match 'ON I + 1 GOTO 10, 20'
      it_should_match 'ONI+1GOTO10,20'
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
      it_should_match 'READ I, A ( 1 )'
      it_should_match 'READI,A(1)'
    end

    describe 'gosub_statement' do
      let(:rule) {parser.gosub_statement}
      it_should_match 'GOSUB 100'
      it_should_match 'GOSUB100'
    end

    describe 'return_statement' do
      let(:rule) {parser.return_statement}
      it_should_match 'RETURN'
    end

    describe 'stop_statement' do
      let(:rule) {parser.stop_statement}
      it_should_match 'STOP'
    end

    describe 'restore_statement' do
      let(:rule) {parser.restore_statement}
      it_should_match 'RESTORE'
      it_should_match 'RESTORE 100'
      it_should_match 'RESTORE100'
    end

    describe 'define_function_statement' do
      let(:rule) {parser.define_function_statement}
      it_should_match 'DEF FNS$ = "FOO"'
      it_should_match 'DEF FNA(I) = 2 * I'
      it_should_match 'DEF FNA ( I , J ) = I + J'
      it_should_match 'DEFFNA(I,J)=I+J'
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
      it_should_match 'RESTORE'
      it_should_match 'DEF FNA(I) = 2 * I'
    end

    describe 'statements' do
      let(:rule) {parser.statements}
      it_should_match 'REM'
      it_should_match 'PRINT:PRINT'
      it_should_match 'PRINT:PRINT:'
      it_should_match 'PRINT : PRINT :'
    end

    describe 'line' do
      let(:rule) {parser.line}
      it_should_match '10REM'
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
