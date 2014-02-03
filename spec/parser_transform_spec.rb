require_relative 'spec_helper'

module Basic

  describe ParserTransform do

    let(:parser) {Parser.new}

    def self.parse(rule, s)
      parser = Parser.new.send(rule)
      parser.parse(s)
    end

    def self.transform(rule, s)
      parse_tree = parse(rule, s)
      ParserTransform.new.apply(parse_tree)
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
      it_should_transform('"abc"', "abc")
    end

    describe 'expression' do
      let(:rule) {:expression}
      it_should_transform('"abc"', "abc")
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

    describe 'print' do
      let(:rule) {:print}
      it_should_transform('PRINT',
                          PrintStatement.new)
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
