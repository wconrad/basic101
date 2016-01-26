# frozen_string_literal: true

require_relative 'spec_helper'

module Basic101

  describe BasicObject do

    describe 'type_name' do
      let(:type_name) {'object'}
      specify {expect(subject.class.type_name).to eq type_name}
      specify {expect(subject.type_name).to eq type_name}
    end

    describe '#eval' do
      let(:runtime) {double Runtime}
      it 'should return itself' do
        expect(subject.eval(runtime)).to eq subject
      end
    end

  end

end
