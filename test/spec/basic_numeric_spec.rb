require_relative 'spec_helper'

module Basic101

  describe BasicNumeric do

    describe 'type_name' do
      let(:type_name) {'numeric'}
      subject {described_class.new(0)}
      specify {expect(subject.class.type_name).to eq type_name}
      specify {expect(subject.type_name).to eq type_name}
    end

  end

end
