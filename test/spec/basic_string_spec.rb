require_relative 'spec_helper'

module Basic101

  describe BasicString do

    it_behaves_like 'a basic object' do
      let(:default_value) {''}
    end

    describe 'type_name' do
      let(:type_name) {'string'}
      subject {described_class.new(0)}
      specify {expect(subject.class.type_name).to eq type_name}
      specify {expect(subject.type_name).to eq type_name}
    end

    describe '#left' do

      context 'when extracting substring' do
        specify do
          s = described_class.new('abcd')
          expect(s.left(2)).to eq described_class.new('ab')
        end
      end

      context 'when extracting null string' do
        specify do
          s = described_class.new('abcd')
          expect(s.left(0)).to eq described_class.new('')
        end
      end

      context 'when extracting entire string' do
        specify do
          s = described_class.new('abcd')
          expect(s.left(10)).to eq described_class.new('abcd')
        end
      end

      context 'when negative' do
        specify do
          s = described_class.new('abcd')
          expect do
            s.left(-1)
          end.to raise_error InvalidArgumentError
        end
      end

    end

    describe '#length' do
      specify do
        s = described_class.new('abc')
        expect(s.length).to eq BasicInteger.new(3)
      end
    end

    describe '#mid' do

      context 'when substring' do
        specify do
          s = described_class.new('abc')
          expect(s.mid(2)).to eq described_class.new('bc')
        end
      end

      context 'when short count' do
        specify do
          s = described_class.new('abc')
          expect(s.mid(2, 1)).to eq described_class.new('b')
        end
      end

      context 'when long count' do
        specify do
          s = described_class.new('abc')
          expect(s.mid(2, 100)).to eq described_class.new('bc')
        end
      end

      context 'when start past end of string' do
        specify do
          s = described_class.new('abc')
          expect(s.mid(100)).to eq described_class.new('')
        end
      end

      context 'when zero start' do
        specify do
          s = described_class.new('abc')
          expect do
            s.mid(0)
          end.to raise_error InvalidArgumentError
        end
      end

      context 'when zero count' do
        specify do
          s = described_class.new('abc')
          expect do
            s.mid(1, 0)
          end.to raise_error InvalidArgumentError
        end
      end

    end

    describe '#+' do

      it 'should concatenate a string' do
        a = described_class.new('abc')
        b = described_class.new('123')
        c = a + b
        expect(c).to eq described_class.new('abc123')
      end

      it 'should not concatenate an integer' do
        a = described_class.new('abc')
        b = BasicInteger.new(1)
        expect {a + b}.to raise_error TypeError
      end

    end

    describe '#right' do

      context 'when entire string' do
        specify do
          a = described_class.new('abc')
          b = a.right(10)
          expect(b).to eq described_class.new('abc')
        end
      end

      context 'when substring' do
        specify do
          a = described_class.new('abc')
          b = a.right(2)
          expect(b).to eq described_class.new('bc')
        end
      end

      context 'when zero count' do
        specify do
          a = described_class.new('abc')
          b = a.right(0)
          expect(b).to eq described_class.new('')
        end
      end

      context 'when negative count' do
        specify do
          a = described_class.new('abc')
          expect { a.right(-1) }.to raise_error InvalidArgumentError
        end
      end

    end

    describe '#asc' do

      context 'when not empty' do
        specify do
          a = described_class.new('ABC')
          expect(a.asc).to eq BasicInteger.new(65)
        end
      end

      context 'when empty' do
        specify do
          a = described_class.new('')
          expect {a.asc}.to raise_error InvalidArgumentError
        end
      end

    end

    describe '#val' do

      it 'converts to a float' do
        a = described_class.new('1.23')
        expect(a.val).to eq BasicFloat.new(1.23)
      end

      it 'converts to an integer' do
        a = described_class.new('-123')
        expect(a.val).to eq BasicInteger.new(-123)
      end

      it 'ignores white space' do
        a = described_class.new("\t\n 123\t\n ")
        expect(a.val).to eq BasicInteger.new(123)
      end

    end

    describe '#to_numeric' do
      it 'should refuse' do
        a = described_class.new('abc')
        expect do
          a.to_numeric
        end.to raise_error TypeError,
        'string cannot be converted to numeric'
      end
    end

    describe '#to_integer' do
      specify do
        a = described_class.new(12)
        expect {a.to_integer}.to raise_error TypeError
      end
    end

    describe '#to_float' do
      specify do
        a = described_class.new(12.34)
        expect {a.to_float}.to raise_error TypeError
      end
    end

    describe '#to_string' do
      specify do
        a = described_class.new('abc')
        expect(a.to_string).to eq a
      end
    end

    describe '#str' do
      it 'should return itself' do
        a = described_class.new('abc')
        expect(a.str).to eq a
      end
    end

    describe 'printing' do

      let(:output) {double Output}
      subject {described_class.new('123')}

      describe '#print_string' do
        specify do
          expect(output).to receive(:print).with('123')
          subject.print_string(output)
        end
      end

      describe '#print_new_line' do
        specify do
          expect(output).to receive(:print).with("\n")
          subject.print_new_line(output)
        end
      end

    end

  end

end
