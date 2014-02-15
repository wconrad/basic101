require_relative 'spec_helper'

module Basic

  describe BasicInteger do

    it_should_behave_like 'a numeric'

    describe '+' do

      it 'should add a BasicInteger' do
        a = BasicInteger.new(1)
        b = BasicInteger.new(2)
        expect(a + b).to eq BasicInteger.new(3)
      end

      it 'should add a BasicFloat' do
        a = BasicInteger.new(1)
        b = BasicFloat.new(2)
        expect(a + b).to eq BasicFloat.new(3)
      end

    end

    describe '-' do

      it 'should subtract a BasicInteger' do
        a = BasicInteger.new(1)
        b = BasicInteger.new(2)
        c = a - b
        expect(c).to be_a BasicInteger
        expect(c.value).to eq -1
      end

      it 'should subtract a BasicFloat' do
        a = BasicInteger.new(1)
        b = BasicFloat.new(2)
        c = a - b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq -1
      end

    end

    describe '*' do

      it 'should multiply a BasicInteger' do
        a = BasicInteger.new(4)
        b = BasicInteger.new(2)
        c = a * b
        expect(c).to be_a BasicInteger
        expect(c.value).to eq 8
      end

      it 'should multiply a BasicFloat' do
        a = BasicInteger.new(4)
        b = BasicFloat.new(2)
        c = a * b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq 8
      end

    end

    describe '/' do

      it 'should divide a BasicInteger' do
        a = BasicInteger.new(4)
        b = BasicInteger.new(2)
        c = a / b
        expect(c).to be_a BasicInteger
        expect(c.value).to eq 2
      end

      it 'should divide a BasicFloat' do
        a = BasicInteger.new(4)
        b = BasicFloat.new(2)
        c = a / b
        expect(c).to be_a BasicFloat
        expect(c.value).to eq 2
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

  end

end
