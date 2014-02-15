require_relative 'spec_helper'

module Basic

  describe Transform do

    let(:parser) {Parser.new}

    def self.parse(rule, s)
      parser = Parser.new.send(rule)
      parser.parse(s)
    end

    def self.transform(rule, s)
      parse_tree = parse(rule, s)
      Transform.new.apply(parse_tree)
    end

    def transform(s, rule = rule)
      self.class.transform(rule, s)
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
      it_should_transform('1.2', BasicFloat.new(1.2))
      it_should_transform('-1.2', BasicFloat.new(-1.2))
      it_should_transform('+1.2', BasicFloat.new(1.2))
    end

    describe 'string' do
      let(:rule) {:string}
      it_should_transform('"abc"', BasicString.new('abc'))
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

    describe 'subscript_reference' do
      let(:rule) {:subscript_reference}
      it_should_transform('FNA("a")',
                          SubscriptReference.new(NumericIdentifier.new('FNA'), [
                                                   BasicString.new("a")
                                                 ]))
      it_should_transform('FNA("a", "b")',
                          SubscriptReference.new(NumericIdentifier.new('FNA'), [
                                                   BasicString.new("a"),
                                                   BasicString.new("b")
                                                 ]))
    end

    describe 'multiply_op' do
      let(:rule) {:multiply_op}
      it_should_transform('*', Multiply.new)
      it_should_transform('/', Divide.new)
    end

    describe 'addition_op' do
      let(:rule) {:addition_op}
      it_should_transform('+', Add.new)
      it_should_transform('-', Subtract.new)
    end

    describe 'comparison_op' do
      let(:rule) {:comparison_op}
      it_should_transform('=', Equal.new)
      it_should_transform('<>', NotEqual.new)
      it_should_transform('<', Less.new)
      it_should_transform('<=', LessOrEqual.new)
      it_should_transform('>', Greater.new)
      it_should_transform('>=', GreaterOrEqual.new)
    end

    describe 'and_op' do
      let(:rule) {:and_op}
      it_should_transform('AND', And.new)
    end

    describe 'or_op' do
      let(:rule) {:or_op}
      it_should_transform('OR', Or.new)
    end

    describe 'term' do
      let(:rule) {:term}
      it_should_transform("1 * 2",
                          BinaryOperations.new(BasicInteger.new(1),
                                            [
                                              BinaryOperation.new(Multiply.new,
                                                                  BasicInteger.new(2)),
                                            ]))
      it_should_transform("1", BasicInteger.new(1))
    end

    describe 'simple_expression' do
      let(:rule) {:simple_expression}
      it_should_transform('"abc"', BasicString.new('abc'))
      it_should_transform('1 + 2', BinaryOperations.new(BasicInteger.new(1),
                                                        [
                                                          BinaryOperation.new(Add.new,
                                                                              BasicInteger.new(2)),
                                                        ]))
    end

    describe 'comparison_expression' do
      let(:rule) {:comparison_expression}
      it_should_transform('"abc"', BasicString.new('abc'))
      it_should_transform('1 < 2', BinaryOperations.new(BasicInteger.new(1),
                                                        [
                                                          BinaryOperation.new(Less.new,
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
                                                          BinaryOperation.new(And.new,
                                                                              BasicInteger.new(0)),
                                                        ]))
    end

    describe 'or_expression' do
      let(:rule) {:or_expression}
      it_should_transform('1', BasicInteger.new(1))
      it_should_transform('1 OR 0', BinaryOperations.new(BasicInteger.new(1),
                                                        [
                                                          BinaryOperation.new(Or.new,
                                                                              BasicInteger.new(0)),
                                                        ]))
    end

    describe 'remark' do
      let(:rule) {:remark}
      it_should_transform('REM THIS IS A REMARK',
                          RemarkStatement.new)
    end

    describe 'print_separator' do
      let(:rule) {:print_separator}
      it_should_transform(';', PrintNull.new)
      it_should_transform(',', PrintTab.new)
    end

    describe 'print_arguments' do
      let(:rule) {:print_arguments}
      it_should_transform('"a"', [BasicString.new('a')])
      it_should_transform('"a",', [
                            BasicString.new('a'),
                            PrintTab.new,
                          ])
    end

    describe 'print' do
      let(:rule) {:print}
      it_should_transform('PRINT',
                          PrintStatement.new)
      it_should_transform('PRINT "ABC"',
                          PrintStatement.new([BasicString.new("ABC")]))
      it_should_transform('PRINT "ABC";',
                          PrintStatement.new([
                                               BasicString.new("ABC"),
                                               PrintNull.new
                                             ]))
    end

    describe 'let' do
      let(:rule) {:let}
      it_should_transform('I=1',
                          LetStatement.new(ScalarReference.new(NumericIdentifier.new('I')),
                                           transform(:expression, '1')))
    end

    describe 'goto' do
      let(:rule) {:goto}
      it_should_transform('GOTO 10', GotoStatement.new(10))
    end
    
    describe 'if_statement' do
      let(:rule) {:if_statement}
      it_should_transform('IF 1 THEN 10',
                          IfStatement.new(BasicInteger.new(1),
                                          BasicInteger.new(10)))
    end

    describe 'randomize' do
      let(:rule) {:randomize}
      it_should_transform('RANDOMIZE', RandomizeStatement.new)
    end

    describe 'input' do
      let(:rule) {:input}
      it_should_transform('INPUT I',
                          InputStatement.new(nil, [
                                               ScalarReference.new(NumericIdentifier.new('I')),
                                             ]))
      it_should_transform('INPUT "FOO"; I',
                          InputStatement.new(BasicString.new('FOO'), [
                                               ScalarReference.new(NumericIdentifier.new('I')),
                                             ]))
      it_should_transform('INPUT I,J',
                          InputStatement.new(nil, [
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
                                             SubscriptReference.new(NumericIdentifier.new('A'), [
                                                                      BasicInteger.new(10),
                                                                    ]),
                                         ]))
      it_should_transform('DIM A(10), B(20)',
                          DimStatement.new([
                                             SubscriptReference.new(NumericIdentifier.new('A'), [
                                                                      BasicInteger.new(10),
                                                                    ]),
                                             SubscriptReference.new(NumericIdentifier.new('B'), [
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
