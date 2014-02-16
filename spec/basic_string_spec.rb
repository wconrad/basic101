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

  end

end
