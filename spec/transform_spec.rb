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
      it_should_transform('123', 123)
    end

    describe 'string' do
      let(:rule) {:string}
      it_should_transform('"abc"', BasicString.new('abc'))
    end

    describe 'expression' do
      let(:rule) {:expression}
      it_should_transform('"abc"', BasicString.new('abc'))
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
                          PrintStatement.new(nil, [BasicString.new("ABC")]))
      it_should_transform('PRINT "ABC";',
                          PrintStatement.new(nil, [
                                               BasicString.new("ABC"),
                                               PrintNull.new
                                             ]))
    end

    describe 'line' do
      let(:rule) {:line}
      it_should_transform('10 PRINT:REM', [
                            PrintStatement.new(10),
                            RemarkStatement.new,
                          ])
    end

  end

end
