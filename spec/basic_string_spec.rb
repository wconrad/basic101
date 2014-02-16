require_relative 'spec_helper'

module Basic

  describe BasicString do

    describe '#left' do

      context 'when extracting substring' do
        specify do
          s = BasicString.new('abcd')
          expect(s.left(2)).to eq BasicString.new('ab')
        end
      end

      context 'when extracting null string' do
        specify do
          s = BasicString.new('abcd')
          expect(s.left(0)).to eq BasicString.new('')
        end
      end

      context 'when extracting entire string' do
        specify do
          s = BasicString.new('abcd')
          expect(s.left(10)).to eq BasicString.new('abcd')
        end
      end

      context 'when negative' do
        specify do
          s = BasicString.new('abcd')
          expect do
            s.left(-1)
          end.to raise_error InvalidArgumentError
        end
      end

    end

    describe '#length' do
      specify do
        s = BasicString.new('abc')
        expect(s.length).to eq BasicInteger.new(3)
      end
    end

    describe '#mid' do

      context 'when substring' do
        specify do
          s = BasicString.new('abc')
          expect(s.mid(2)).to eq BasicString.new('bc')
        end
      end

      context 'when short count' do
        specify do
          s = BasicString.new('abc')
          expect(s.mid(2, 1)).to eq BasicString.new('b')
        end
      end

      context 'when long count' do
        specify do
          s = BasicString.new('abc')
          expect(s.mid(2, 100)).to eq BasicString.new('bc')
        end
      end

      context 'when start past end of string' do
        specify do
          s = BasicString.new('abc')
          expect(s.mid(100)).to eq BasicString.new('')
        end
      end

      context 'when zero start' do
        specify do
          s = BasicString.new('abc')
          expect do
            s.mid(0)
          end.to raise_error InvalidArgumentError
        end
      end

      context 'when zero count' do
        specify do
          s = BasicString.new('abc')
          expect do
            s.mid(1, 0)
          end.to raise_error InvalidArgumentError
        end
      end

    end

    describe '#+' do
      specify do
        a = BasicString.new('abc')
        b = BasicString.new('123')
        c = a + b
        expect(c).to eq BasicString.new('abc123')
      end
    end

  end

end
