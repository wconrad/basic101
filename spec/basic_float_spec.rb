require_relative 'spec_helper'

module Basic

  describe BasicFloat do

    it_should_behave_like 'a numeric'

    describe '+' do

      it 'should add a BasicInteger' do
        a = BasicFloat.new(1)
        b = BasicInteger.new(2)
        c = a + b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq 3
      end

      it 'should add a BasicFloat' do
        a = BasicFloat.new(1)
        b = BasicFloat.new(2)
        c = a + b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq 3
      end

    end

    describe '-' do

      it 'should subtract a BasicInteger' do
        a = BasicFloat.new(1)
        b = BasicInteger.new(2)
        c = a - b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq -1
      end

      it 'should subtract a BasicFloat' do
        a = BasicFloat.new(1)
        b = BasicFloat.new(2)
        c = a - b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq -1
      end

    end

    describe '*' do

      it 'should multiply a BasicInteger' do
        a = BasicFloat.new(4)
        b = BasicInteger.new(2)
        c = a * b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq 8
      end

      it 'should multiply a BasicFloat' do
        a = BasicFloat.new(4)
        b = BasicFloat.new(2)
        c = a * b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq 8
      end

    end

    describe '/' do

      it 'should divide a BasicInteger' do
        a = BasicFloat.new(5)
        b = BasicInteger.new(2)
        c = a / b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq 2
      end

      it 'should divide a BasicFloat' do
        a = BasicFloat.new(5)
        b = BasicFloat.new(2)
        c = a / b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq 2
      end

    end

    describe '#to_integer' do
      specify do
        a = BasicFloat.new(2.6)
        expect(a.to_integer).to eq BasicInteger.new(2)
      end
    end

    describe '#and' do
      specify do
        a = BasicFloat.new(0b1100)
        b = BasicInteger.new(0b0110)
        c = a.and(b)
        expect(c).to eq BasicInteger.new(0b0100)
      end
    end

    describe '#or' do
      specify do
        a = BasicFloat.new(0b1100)
        b = BasicInteger.new(0b0110)
        c = a.or(b)
        expect(c).to eq BasicInteger.new(0b1110)
      end
    end

    describe '#not' do
      specify do
        a = BasicFloat.new(10)
        b = a.not
          expect(b).to eq BasicInteger.new(-11)
      end
    end

    describe '#floor' do
      specify do
        a = BasicFloat.new(-1.5)
        b = a.floor
        expect(b).to eq BasicFloat.new(-2.0)
      end
    end

  end

end
