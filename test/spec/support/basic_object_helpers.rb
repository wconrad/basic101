module BasicObjectHelpers

  include Basic101

  shared_examples 'a basic object' do

    describe '#val' do
      it 'should return itself' do
        runtime = double Runtime
        a = described_class.new(default_value)
        b = a.eval(runtime)
        expect(b).to eq a
      end
    end

  end

end

RSpec.configure do |config|
  config.include BasicObjectHelpers
end
