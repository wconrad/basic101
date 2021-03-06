# frozen_string_literal: true

require_relative 'spec_helper'

module Basic101

  describe Transform do

    let(:parser) {Parser.new}

    def self.parse(rule_name, s)
      parser = Parser.new.send(rule_name)
      parser.parse(s)
    end

    def self.transform(rule_name, s)
      parse_tree = parse(rule_name, s)
      Transform.new.apply(parse_tree)
    end

    def transform(s, rule_name = rule)
      self.class.transform(rule_name, s)
    end

    def self.it_should_transform(s, expected_result)
      it "should transform #{s.inspect}" do
        expect(transform(s)).to eq expected_result
      end
    end

    describe 'integer' do
      let(:rule) {:integer}
      it_should_transform('123', BasicInteger.new(123))
      it_should_transform('-123', BasicInteger.new(-123))
      it_should_transform('+123', BasicInteger.new(123))
    end

    describe 'float' do
      let(:rule) {:float}
      it_should_transform('.2', BasicFloat.new(0.2))
      it_should_transform('1.2', BasicFloat.new(1.2))
      it_should_transform('-1.2', BasicFloat.new(-1.2))
      it_should_transform('+1.2', BasicFloat.new(1.2))
      it_should_transform('1E-10', BasicFloat.new(1E-10))
    end

    describe 'quoted_string' do
      let(:rule) {:unquoted_string}
      it_should_transform('abc', BasicString.new('abc'))
    end

    describe 'quoted_string' do
      let(:rule) {:quoted_string}
      it_should_transform('"abc"', BasicString.new('abc'))
      it_should_transform('""', BasicString.new(''))
    end

    describe 'data_item' do
      let(:rule) {:data_item}
      it_should_transform('abc', BasicString.new('abc'))
      it_should_transform('"abc"', BasicString.new('abc'))
      it_should_transform('123', BasicInteger.new(123))
      it_should_transform('123.45', BasicFloat.new(123.45))
    end

    describe 'data_statement' do
      let(:rule) {:data_statement}
      it_should_transform('DATA 1', 
                          DataStatement.new([
                                              BasicInteger.new(1),
                                            ]))
      it_should_transform('DATA 1, 2', 
                          DataStatement.new([
                                              BasicInteger.new(1),
                                              BasicInteger.new(2),
                                            ]))
    end

    describe 'read_statement' do
      let(:rule) {:read_statement}
      it_should_transform('READ I',
                          ReadStatement.new([
                                              ScalarReference.new(NumericIdentifier.new('I')),
                                            ]))
      it_should_transform('READ I, J',
                          ReadStatement.new([
                                              ScalarReference.new(NumericIdentifier.new('I')),
                                              ScalarReference.new(NumericIdentifier.new('J')),
                                            ]))
    end

    describe 'gosub_statement' do
      let(:rule) {:gosub_statement}
      it_should_transform('GOSUB 100',
                          GosubStatement.new(100))
    end

    describe 'return_statement' do
      let(:rule) {:return_statement}
      it_should_transform('RETURN', ReturnStatement.new)
    end

    describe 'built_in_function_identifier' do
      let(:rule) {:built_in_function_identifier}
      it_should_transform('LEN', FunctionIdentifier.new('LEN'))
      it_should_transform('STR$', FunctionIdentifier.new('STR$'))
    end

    describe 'user_defined_function_identifier' do
      let(:rule) {:user_defined_function_identifier}
      it_should_transform('FNA', FunctionIdentifier.new('FNA'))
      it_should_transform('FNS$', FunctionIdentifier.new('FNS$'))
    end

    describe 'numeric_identifier' do
      let(:rule) {:numeric_identifier}
      it_should_transform('I', NumericIdentifier.new('I'))
    end

    describe 'string_identifier' do
      let(:rule) {:string_identifier}
      it_should_transform('A$', StringIdentifier.new('A$'))
    end

    describe 'scalar_reference' do
      let(:rule) {:scalar_reference}
      it_should_transform('A', ScalarReference.new(NumericIdentifier.new('A')))
    end

    describe 'array_reference' do
      let(:rule) {:array_reference}
      it_should_transform('A("a")',
                          ArrayReference.new(NumericIdentifier.new('A'), [
                                               BasicString.new("a")
                                             ]))
      it_should_transform('A("a", "b")',
                          ArrayReference.new(NumericIdentifier.new('A'), [
                                               BasicString.new("a"),
                                               BasicString.new("b"),
                                             ]))
    end

    describe 'function_call' do
      let(:rule) {:function_call}
      it_should_transform('LEN("a")',
                          FunctionCall.new(FunctionIdentifier.new('LEN'), [
                                             BasicString.new("a")
                                           ]))
      it_should_transform('FNA(1, 2)',
                          FunctionCall.new(FunctionIdentifier.new('FNA'), [
                                             BasicInteger.new(1),
                                             BasicInteger.new(2),
                                           ]))
      
    end

    describe 'power' do
      let(:rule) {:power}
      it_should_transform('1', BasicInteger.new(1))
      it_should_transform('1^2',
                          PowerOperation.new(BasicInteger.new(1),
                                             BasicInteger.new(2)))
      it_should_transform('1^2^3',
                          PowerOperation.new(BasicInteger.new(1),
                                             PowerOperation.new(BasicInteger.new(2),
                                                                BasicInteger.new(3))))
    end

    describe 'negation' do
      let(:rule) {:negation}
      it_should_transform('-1',
                          NegateOperation.new(BasicInteger.new(1)))
    end

    describe 'multiply_op' do
      let(:rule) {:multiply_op}
      it_should_transform('*', :*)
      it_should_transform('/', :/)
    end

    describe 'addition_op' do
      let(:rule) {:addition_op}
      it_should_transform('+', :+)
      it_should_transform('-', :-)
    end

    describe 'comparison_op' do
      let(:rule) {:comparison_op}
      it_should_transform('=', :eq)
      it_should_transform('<>', :ne)
      it_should_transform('<', :lt)
      it_should_transform('<=', :le)
      it_should_transform('>', :gt)
      it_should_transform('>=', :ge)
    end

    describe 'and_op' do
      let(:rule) {:and_op}
      it_should_transform('AND', :and)
    end

    describe 'or_op' do
      let(:rule) {:or_op}
      it_should_transform('OR', :or)
    end

    describe 'term' do
      let(:rule) {:term}
      it_should_transform("1 * 2",
                          BinaryOperations.new(BasicInteger.new(1),
                                               [
                                                 BinaryOperation.new(:*,
                                                                     BasicInteger.new(2)),
                                               ]))
      it_should_transform("1", BasicInteger.new(1))
    end

    describe 'simple_expression' do
      let(:rule) {:simple_expression}
      it_should_transform('"abc"', BasicString.new('abc'))
      it_should_transform('1 + 2', BinaryOperations.new(BasicInteger.new(1),
                                                        [
                                                          BinaryOperation.new(:+,
                                                                              BasicInteger.new(2)),
                                                        ]))
    end

    describe 'comparison_expression' do
      let(:rule) {:comparison_expression}
      it_should_transform('"abc"', BasicString.new('abc'))
      it_should_transform('1 < 2', BinaryOperations.new(BasicInteger.new(1),
                                                        [
                                                          BinaryOperation.new(:lt,
                                                                              BasicInteger.new(2)),
                                                        ]))
    end

    describe 'not_expression' do
      let(:rule) {:not_expression}
      it_should_transform('1', BasicInteger.new(1))
      it_should_transform('NOT 1',
                          NotOperation.new(BasicInteger.new(1)))
    end

    describe 'and_expression' do
      let(:rule) {:and_expression}
      it_should_transform('1', BasicInteger.new(1))
      it_should_transform('1 AND 0', BinaryOperations.new(BasicInteger.new(1),
                                                          [
                                                            BinaryOperation.new(:and,
                                                                                BasicInteger.new(0)),
                                                          ]))
    end

    describe 'or_expression' do
      let(:rule) {:or_expression}
      it_should_transform('1', BasicInteger.new(1))
      it_should_transform('1 OR 0', BinaryOperations.new(BasicInteger.new(1),
                                                         [
                                                           BinaryOperation.new(:or,
                                                                               BasicInteger.new(0)),
                                                         ]))
    end

    describe 'remark_statement' do
      let(:rule) {:remark_statement}
      it_should_transform('REM THIS IS A REMARK',
                          RemarkStatement.new)
    end

    describe 'print_separator' do
      let(:rule) {:print_separator}
      it_should_transform(';', PrintSemicolon.new)
      it_should_transform(',', PrintComma.new)
    end

    describe 'print_arguments' do
      let(:rule) {:print_arguments}
      it_should_transform('"a"', [BasicString.new('a')])
      it_should_transform('"a",', [
                            BasicString.new('a'),
                            PrintComma.new,
                          ])
    end
 
    describe 'print_statement' do
      let(:rule) {:print_statement}
      it_should_transform('PRINT',
                          PrintStatement.new)
      it_should_transform('PRINT ,',
                          PrintStatement.new([
                                               PrintComma.new
                                             ]))
      it_should_transform('PRINT , 1',
                          PrintStatement.new([
                                               PrintComma.new,
                                               BasicInteger.new(1),
                                             ]))
      it_should_transform('PRINT "ABC"',
                          PrintStatement.new([BasicString.new("ABC")]))
      it_should_transform('PRINT 1;',
                          PrintStatement.new([
                                               BasicInteger.new(1),
                                               PrintSemicolon.new,
                                             ]))
      it_should_transform('PRINT 1, 2',
                          PrintStatement.new([
                                               BasicInteger.new(1),
                                               PrintComma.new,
                                               BasicInteger.new(2),
                                             ]))
    end

    describe 'let_statement' do
      let(:rule) {:let_statement}
      it_should_transform('I=1',
                          LetStatement.new(ScalarReference.new(NumericIdentifier.new('I')),
                                           transform(:expression, '1')))
    end

    describe 'goto_statement' do
      let(:rule) {:goto_statement}
      it_should_transform('GOTO 10', GotoStatement.new(10))
    end

    describe 'if_block' do
      let(:rule) {:if_block}
      it_should_transform('10', GotoStatement.new(10))
      it_should_transform('PRINT', PrintStatement.new)
      it_should_transform('PRINT:PRINT', [
                            PrintStatement.new,
                            PrintStatement.new
                          ])
    end
    
    describe 'if_statement' do
      let(:rule) {:if_statement}
      it_should_transform('IF 1 THEN 10', [
                            IfStatement.new(BasicInteger.new(1)),
                            GotoStatement.new(10),
                            ElseStatement.new,
                            EndifStatement.new,
                          ])
      it_should_transform('IF 0 THEN RANDOMIZE', [
                            IfStatement.new(BasicInteger.new(0)),
                            RandomizeStatement.new,
                            ElseStatement.new,
                            EndifStatement.new,
                          ])
      it_should_transform('IF 0 THEN RANDOMIZE : PRINT', [
                            IfStatement.new(BasicInteger.new(0)),
                            RandomizeStatement.new,
                            PrintStatement.new,
                            ElseStatement.new,
                            EndifStatement.new,
                          ])
      it_should_transform('IF 0 THEN RANDOMIZE ELSE PRINT', [
                            IfStatement.new(BasicInteger.new(0)),
                            RandomizeStatement.new,
                            ElseStatement.new,
                            PrintStatement.new,
                            EndifStatement.new,
                          ])
    end

    describe 'randomize_statement' do
      let(:rule) {:randomize_statement}
      it_should_transform('RANDOMIZE', RandomizeStatement.new)
    end

    describe 'prompt_delimeter' do
      let(:rule) {:prompt_delimeter}
      it_should_transform(';', PromptDelimeter.new)
      it_should_transform(',', NullPromptDelimeter.new)
    end

    describe 'input' do
      let(:rule) {:input_statement}
      it_should_transform('INPUT I',
                          InputStatement.new(nil, PromptDelimeter.new, [
                                               ScalarReference.new(NumericIdentifier.new('I')),
                                             ]))
      it_should_transform('INPUT "FOO"; I',
                          InputStatement.new(BasicString.new('FOO'),
                                             PromptDelimeter.new,
                                             [
                                               ScalarReference.new(NumericIdentifier.new('I')),
                                             ]))
      it_should_transform('INPUT I,J',
                          InputStatement.new(nil, PromptDelimeter.new, [
                                               ScalarReference.new(NumericIdentifier.new('I')),
                                               ScalarReference.new(NumericIdentifier.new('J')),
                                             ]))
    end

    describe 'end_statement' do
      let(:rule) {:end_statement}
      it_should_transform('END', EndStatement.new)
    end

    describe 'dim_statement' do
      let(:rule) {:dim_statement}
      it_should_transform('DIM A(10)',
                          DimStatement.new([
                                             ArrayReference.new(NumericIdentifier.new('A'), [
                                                                  BasicInteger.new(10),
                                                                ]),
                                           ]))
      it_should_transform('DIM A(10), B(20)',
                          DimStatement.new([
                                             ArrayReference.new(NumericIdentifier.new('A'), [
                                                                  BasicInteger.new(10),
                                                                ]),
                                             ArrayReference.new(NumericIdentifier.new('B'), [
                                                                  BasicInteger.new(20),
                                                                ]),
                                           ]))
    end

    describe 'for_statement' do
      let(:rule) {:for_statement}
      it_should_transform('FOR I = 1 TO 10',
                          ForStatement.new(ScalarReference.new(NumericIdentifier.new('I')),
                                           BasicInteger.new(1),
                                           BasicInteger.new(10),
                                           nil))
      it_should_transform('FOR I = 1 TO 10 STEP 2',
                          ForStatement.new(ScalarReference.new(NumericIdentifier.new('I')),
                                           BasicInteger.new(1),
                                           BasicInteger.new(10),
                                           BasicInteger.new(2)))
    end

    describe 'next_statement' do
      let(:rule) {:next_statement}
      it_should_transform('NEXT', [
                            NextStatement.new(nil),
                          ])
      it_should_transform('NEXT I', [
                            NextStatement.new(ScalarReference.new(NumericIdentifier.new('I'))),
                          ])
      it_should_transform('NEXT I, J', [
                            NextStatement.new(ScalarReference.new(NumericIdentifier.new('I'))),
                            NextStatement.new(ScalarReference.new(NumericIdentifier.new('J'))),
                          ])
    end

    describe 'on_goto_statement' do
      let(:rule) {:on_goto_statement}
      it_should_transform('ON I GOTO 10',
                          OnGotoStatement.new(ScalarReference.new(NumericIdentifier.new('I')),
                                              [
                                                BasicInteger.new(10),
                                              ]))
      it_should_transform('ON I GOTO 10, 20',
                          OnGotoStatement.new(ScalarReference.new(NumericIdentifier.new('I')),
                                              [
                                                BasicInteger.new(10),
                                                BasicInteger.new(20),
                                              ]))
    end

    describe 'stop_statement' do
      let(:rule) {:stop_statement}
      it_should_transform('STOP', StopStatement.new)
    end

    describe 'restore_statement' do
      let(:rule) {:restore_statement}
      it_should_transform('RESTORE', RestoreStatement.new(nil))
      it_should_transform('RESTORE 10',
                          RestoreStatement.new(BasicInteger.new(10)))
    end

    describe 'define_function_statement' do
      let(:rule) {:define_function_statement}
      it_should_transform('DEF FNA$(A) = "."',
                          DefineFunctionStatement.new(FunctionIdentifier.new('FNA$'),
                                                      [
                                                        ScalarReference.new(NumericIdentifier.new('A')),
                                                      ],
                                                      BasicString.new('.')))
      it_should_transform('DEF FNA(I, J) = 1',
                          DefineFunctionStatement.new(FunctionIdentifier.new('FNA'),
                                                      [
                                                        ScalarReference.new(NumericIdentifier.new('I')),
                                                        ScalarReference.new(NumericIdentifier.new('J')),
                                                      ],
                                                      BasicInteger.new(1)))
    end

    describe 'line' do
      let(:rule) {:line}
      it_should_transform('10 REM',
                          Line.new(10, [RemarkStatement.new]))
    end

    describe 'program' do
      let(:rule) {:program}
      it_should_transform('',
                          Program.new([]))
      it_should_transform("10 REM\n",
                          Program.new([
                                        Line.new(10, [RemarkStatement.new]),
                                      ]))
      it_should_transform("10 REM\n20 PRINT",
                          Program.new([
                                        Line.new(10, [RemarkStatement.new]),
                                        Line.new(20, [PrintStatement.new]),
                                      ]))
    end

  end

end
