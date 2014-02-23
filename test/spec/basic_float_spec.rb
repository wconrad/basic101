require_relative 'spec_helper'

module Basic101

  describe BasicFloat do

    it_should_behave_like 'a basic numeric'

    describe '#simplest' do

      context 'when no fractional part' do
        it 'should return a basic integer' do
          a = described_class.new(12.0)
          b = a.simplest
          b.should eq BasicInteger.new(12)
        end
      end

      context 'when fractional part' do
        it 'should return itself' do
          a = described_class.new(12.34)
          b = a.simplest
          b.should eq a
        end
      end

    end

    describe '.from_s' do

      context 'when fixed-point' do
        specify do
          a = '1.2'
          b = described_class.from_s(a)
          expect(b.value).to eq 1.2
        end
      end

      context 'when exponential' do
        specify do
          a = '-1.2E-2'
          b = described_class.from_s(a)
          expect(b.value).to eq -1.2E-2
        end
      end

      context 'when no leading digits' do
        specify do
          a = '.2'
          b = described_class.from_s(a)
          expect(b.value).to eq 0.2
        end
      end

      context 'when no trailing digits' do
        specify do
          a = '2.'
          b = described_class.from_s(a)
          expect(b.value).to eq 2.0
        end
      end

    end

    describe '#to_integer' do
      specify do
        a = described_class.new(2.6)
        expect(a.to_integer).to eq BasicInteger.new(2)
      end
    end

    describe '#to_float' do
      specify do
        a = described_class.new(2.6)
        expect(a.to_float).to eq a
      end
    end

    describe '#to_string' do
      specify do
        a = described_class.new(2.6)
        expect{a.to_string}.to raise_error TypeError
      end
    end

    describe '#and' do
      specify do
        a = described_class.new(0b1100)
        b = BasicInteger.new(0b0110)
        c = a.and(b)
        expect(c).to eq BasicInteger.new(0b0100)
      end
    end

    describe '#or' do
      specify do
        a = described_class.new(0b1100)
        b = BasicInteger.new(0b0110)
        c = a.or(b)
        expect(c).to eq BasicInteger.new(0b1110)
      end
    end

    describe '#not' do
      specify do
        a = described_class.new(10)
        b = a.not
          expect(b).to eq BasicInteger.new(-11)
      end
    end

    describe '#floor' do
      specify do
        a = described_class.new(-1.5)
        b = a.floor
        expect(b).to eq described_class.new(-2.0)
      end
    end

    describe '#abs' do

      it 'should turn negative into positive' do
        a = described_class.new(-1.5)
        b = a.abs
        expect(b).to eq described_class.new(1.5)
      end

      it 'should leave positive alone' do
        a = described_class.new(1.5)
        b = a.abs
        expect(b).to eq described_class.new(1.5)
      end

    end

    describe '#sqr' do
      specify do
        a = described_class.new(2)
        b = a.sqr
        expect(b).to eq described_class.new(2 ** 0.5)
      end
    end

    describe '#exp' do
      specify do
        a = described_class.new(1.5)
        b = a.exp
        expect(b).to eq described_class.new(Math::E ** 1.5)
      end
    end
 
   describe '#str' do
      specify do
        a = described_class.new(-12.34)
        expect(a.str).to eq BasicString.new('-12.34')
      end
    end

  end

end
