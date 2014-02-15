require_relative 'spec_helper'

module Basic

  describe BasicArray do

    let(:default) {BasicInteger.new(0)}
    subject {BasicArray.new(num_dimensions, default)}

    describe 'default dimensions' do

      context 'when 1 dimension' do
        let(:num_dimensions) {1}
        it 'should set each element to the default' do
          expect(subject.get([0])).to eq default
          expect(subject.get([10])).to eq default
        end
      end

      context 'when 2 dimensions' do
        let(:num_dimensions) {2}
        it 'should set each element to the default' do
          expect(subject.get([0, 0])).to eq default
          expect(subject.get([0, 10])).to eq default
          expect(subject.get([10, 0])).to eq default
          expect(subject.get([10, 10])).to eq default
        end
      end

    end

    describe '#dimension' do

      context 'when normal' do
        let(:num_dimensions) {2}
        before(:each) {subject.dimension([2, 3])} 
        it 'should set each element to the default' do
          expect(subject.get([0, 0])).to eq default
          expect(subject.get([0, 3])).to eq default
          expect(subject.get([2, 0])).to eq default
          expect(subject.get([2, 3])).to eq default
        end
      end

      context 'max index 0' do
        let(:num_dimensions) {1}
        before(:each) {subject.dimension([0])} 
        specify do
          expect(subject.get([0])).to eq default
        end
      end

      context 'negative max index' do
        let(:num_dimensions) {1}
        specify do
          expect{subject.dimension([-1])}.to raise_error ArraySizeError
        end
      end

    end

    describe '#set' do
      let(:num_dimensions) {2}
      before(:each) do
        subject.dimension([1, 1])
        subject.set([0, 0], BasicInteger.new(1))
        subject.set([0, 1], BasicInteger.new(2))
        subject.set([1, 0], BasicInteger.new(3))
        subject.set([1, 1], BasicInteger.new(4))
      end
      specify {expect(subject.get([0, 0])).to eq BasicInteger.new(1)}
      specify {expect(subject.get([0, 1])).to eq BasicInteger.new(2)}
      specify {expect(subject.get([1, 0])).to eq BasicInteger.new(3)}
      specify {expect(subject.get([1, 1])).to eq BasicInteger.new(4)}
    end

    describe 'bounds checking' do

      let(:num_dimensions) {2}

      it 'should reject negative indices' do
        expect{subject.get([0, -1])}.to raise_error IndexError
      end

      it 'should reject too few indices' do
        expect{subject.get([0])}.to raise_error IndexError
      end

      it 'should reject too many indices' do
        expect{subject.get([0, 0, 0])}.to raise_error IndexError
      end

      it 'should reject too large an index' do
        expect{subject.get([0, 11])}.to raise_error IndexError
      end
    end

  end

end
