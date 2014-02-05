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

    def transform(s)
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

    describe 'scalar_reference' do
      let(:rule) {:scalar_reference}
      it_should_transform('A', ScalarReference.new('A'))
    end

    describe 'subscript_reference' do
      let(:rule) {:subscript_reference}
      it_should_transform('FNA("a")',
                          SubscriptReference.new('FNA', [
                                                   BasicString.new("a")
                                                 ]))
      it_should_transform('FNA("a", "b")',
                          SubscriptReference.new('FNA', [
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

    describe 'expression' do
      let(:rule) {:expression}
      it_should_transform('"abc"', BasicString.new('abc'))
      it_should_transform('1 + 2', BinaryOperations.new(BasicInteger.new(1),
                                                        [
                                                          BinaryOperation.new(Add.new,
                                                                              BasicInteger.new(2)),
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
                          LetStatement.new(ScalarReference.new('I'),
                                           transform(:expression, '1')))
    end

    describe 'goto' do
      let(:rule) {:goto}
      it_should_transform('GOTO 10', GotoStatement.new(10))
    end

    describe 'line' do
      let(:rule) {:line}
      print_statement = PrintStatement.new
      print_statement.line_number = 10
      it_should_transform('10 PRINT:REM', [
                            print_statement,
                            RemarkStatement.new,
                          ])
    end

  end

end
