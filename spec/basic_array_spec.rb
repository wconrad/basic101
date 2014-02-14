require_relative 'spec_helper'

module Basic

  describe BasicArray do

    let(:dimensions) {[10]}
    let(:num_dimensions) {dimensions.size}
    let(:default) {BasicInteger.new(0)}
    subject {BasicArray.new(num_dimensions, default)}

    describe 'default dimensions' do

      context 'when 1 dimension' do
        let(:dimensions) {[10]}
        its(:dimensions) {should eq [10]}
        it 'should set each element to the default' do
          expect(subject.get([9])).to eq default
        end
      end

      context 'when 2 dimensions' do
        let(:dimensions) {[10, 10]}
        its(:dimensions) {should eq [10, 10]}
        it 'should set each element to the default' do
          expect(subject.get([9, 9])).to eq default
        end
      end

    end

    describe '#dimension' do
      its(:dimensions) {should eq [2, 3, 4]}
      before(:each) {subject.dimension([2, 3, 4])}
      it 'should set each element to the default' do
        expect(subject.get([1, 2, 3])).to eq default
      end
    end

    describe '#set' do
      let(:dimensions) {[2, 2]}
      before(:each) do
        subject.dimension(dimensions)
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

  end

end
