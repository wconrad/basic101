require_relative 'spec_helper'

module Basic

  describe BasicFloat do

    it_should_behave_like 'a numeric'

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

    describe '#abs' do

      it 'should turn negative into positive' do
        a = BasicFloat.new(-1.5)
        b = a.abs
        expect(b).to eq BasicFloat.new(1.5)
      end

      it 'should leave positive alone' do
        a = BasicFloat.new(1.5)
        b = a.abs
        expect(b).to eq BasicFloat.new(1.5)
      end

    end

    describe '#sqr' do
      specify do
        a = BasicFloat.new(2)
        b = a.sqr
        expect(b).to eq BasicFloat.new(2 ** 0.5)
      end
    end

    describe '#exp' do
      specify do
        a = BasicFloat.new(1.5)
        b = a.exp
        expect(b).to eq BasicFloat.new(Math::E ** 1.5)
      end
    end

  end

end
