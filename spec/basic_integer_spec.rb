require_relative 'spec_helper'

module Basic101

  describe BasicInteger do

    it_should_behave_like 'a numeric'

    describe '.from_bool' do

      it 'should convert true to basic -1' do
        a = BasicInteger.from_bool(true)
        expect(a).to eq BasicInteger.new(-1)
      end

      it 'should convert false to basic 0' do
        a = BasicInteger.from_bool(false)
        expect(a).to eq BasicInteger.new(0)
      end

    end

    describe '#str' do
      specify do
        a = BasicInteger.new(-12)
        expect(a.str).to eq BasicString.new('-12')
      end
    end

    describe '#to_integer' do
      specify do
        a = BasicInteger.new(1)
        expect(a.to_integer).to eq a
      end
    end

    describe '#to_float' do
      specify do
        a = BasicInteger.new(1)
        expect(a.to_float).to eq BasicFloat.new(1)
      end
    end

    describe '#to_string' do
      specify do
        a = BasicInteger.new(1)
        expect {a.to_string}.to raise_error TypeError
      end
    end

    describe '#and' do

      context 'when 0, 0' do
        specify do
          a = BasicInteger.new(0)
          b = BasicInteger.new(0)
          c = a.and(b)
          expect(c).to eq BasicInteger.new(0)
        end
      end

      context 'when 0, -1' do
        specify do
          a = BasicInteger.new(0)
          b = BasicInteger.new(-1)
          c = a.and(b)
          expect(c).to eq BasicInteger.new(0)
        end
      end

      context 'when -1, 0' do
        specify do
          a = BasicInteger.new(-1)
          b = BasicInteger.new(0)
          c = a.and(b)
          expect(c).to eq BasicInteger.new(0)
        end
      end

      context 'when -1, -1' do
        specify do
          a = BasicInteger.new(-1)
          b = BasicInteger.new(-1)
          c = a.and(b)
          expect(c).to eq BasicInteger.new(-1)
        end
      end

      context 'when bitwise' do
        specify do
          a = BasicInteger.new(0b1100)
          b = BasicInteger.new(0b0110)
          c = a.and(b)
          expect(c).to eq BasicInteger.new(0b0100)
        end
      end

      context 'when float' do
        specify do
          a = BasicFloat.new(0b11)
          b = BasicFloat.new(-1.5)
          c = a.and(b)
          expect(c).to eq BasicInteger.new(0b11)
        end
      end

    end

    describe '#or' do

      context 'when 0, 0' do
        specify do
          a = BasicInteger.new(0)
          b = BasicInteger.new(0)
          c = a.or(b)
          expect(c).to eq BasicInteger.new(0)
        end
      end

      context 'when 0, -1' do
        specify do
          a = BasicInteger.new(0)
          b = BasicInteger.new(-1)
          c = a.or(b)
          expect(c).to eq BasicInteger.new(-1)
        end
      end

      context 'when -1, 0' do
        specify do
          a = BasicInteger.new(-1)
          b = BasicInteger.new(0)
          c = a.or(b)
          expect(c).to eq BasicInteger.new(-1)
        end
      end

      context 'when -1, -1' do
        specify do
          a = BasicInteger.new(-1)
          b = BasicInteger.new(-1)
          c = a.or(b)
          expect(c).to eq BasicInteger.new(-1)
        end
      end

      context 'when bitwise' do
        specify do
          a = BasicInteger.new(0b1100)
          b = BasicInteger.new(0b0110)
          c = a.or(b)
          expect(c).to eq BasicInteger.new(0b1110)
        end
      end

      context 'when float' do
        specify do
          a = BasicFloat.new(1)
          b = BasicFloat.new(-2.2)
          c = a.or(b)
          expect(c).to eq BasicInteger.new(-1)
        end
      end

    end

    describe '#not' do

      context 'when 0' do
        specify do
          a = BasicInteger.new(0)
          b = a.not
          expect(b).to eq BasicInteger.new(-1)
        end
      end

      context 'when -1' do
        specify do
          a = BasicInteger.new(-1)
          b = a.not
          expect(b).to eq BasicInteger.new(0)
        end
      end

      context 'when bitwise' do
        specify do
          a = BasicInteger.new(123)
          b = a.not
            expect(b).to eq BasicInteger.new(-124)
        end
      end

    end

    describe '#chr' do

      context 'normal' do
        specify do
          a = BasicInteger.new(65)
          b = a.chr
          expect(b).to eq BasicString.new("A")
        end
      end

      context 'value too small' do
        specify do
          a = BasicInteger.new(-1)
          expect {a.chr}.to raise_error InvalidArgumentError
        end
      end

      context 'value too large' do
        specify do
          a = BasicInteger.new(256)
          expect {a.chr}.to raise_error InvalidArgumentError
        end
      end

    end

    describe '#abs' do

      it 'should turn negative into positive' do
        a = BasicInteger.new(-1)
        b = a.abs
        expect(b).to eq BasicInteger.new(1)
      end

      it 'should leave positive alone' do
        a = BasicInteger.new(1)
        b = a.abs
        expect(b).to eq BasicInteger.new(1)
      end

    end

    describe '#sqr' do
      specify do
        a = BasicInteger.new(4)
        b = a.sqr
        expect(b).to eq BasicInteger.new(2)
      end
    end

    describe '#exp' do
      specify do
        a = BasicInteger.new(4)
        b = a.exp
        expect(b).to eq BasicFloat.new(Math::E ** 4)
      end
    end

  end

end
