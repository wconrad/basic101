module NumericHelpers

  include Basic

  shared_examples 'a numeric' do

    shared_examples 'compares against type' do |type|

      describe '#compare' do

        it "should be less than a #{type}" do
          a = described_class.new(-1)
          b = BasicInteger.new(0)
          expect(a.compare(b)).to eq -1
        end

        it "should be equal to a #{type}" do
          a = described_class.new(0)
          b = BasicInteger.new(0)
          expect(a.compare(b)).to eq 0
        end

        it "should be greater than a #{type}" do
          a = described_class.new(1)
          b = BasicInteger.new(0)
          expect(a.compare(b)).to eq +1
        end

      end

      describe 'comparison methods' do

        shared_examples 'compares using a method' do
          |method, less_than_result, equal_to_result, greater_than_result|

          describe "##{method}" do

            context 'when <' do
              specify do
                a = described_class.new(-1)
                b = type.new(0)
                c = a.send(method, b)
                expect(c).to eq BasicInteger.from_bool(less_than_result)
              end
            end

            context 'when =' do
              specify do
                a = described_class.new(0)
                b = type.new(0)
                c = a.send(method, b)
                expect(c).to eq BasicInteger.from_bool(equal_to_result)
              end
            end

            context 'when >' do
              specify do
                a = described_class.new(1)
                b = type.new(0)
                c = a.send(method, b)
                expect(c).to eq BasicInteger.from_bool(greater_than_result)
              end
            end

          end
          
        end

        it_behaves_like 'compares using a method', :gt, false, false, true
        it_behaves_like 'compares using a method', :ge, false, true, true
        it_behaves_like 'compares using a method', :eq, false, true, false
        it_behaves_like 'compares using a method', :le, true, true, false
        it_behaves_like 'compares using a method', :lt, true, false, false
        it_behaves_like 'compares using a method', :ne, true, false, true

      end

    end

    it_should_behave_like 'compares against type', BasicInteger
    it_should_behave_like 'compares against type', BasicFloat

    describe '#sgn' do

      context 'when negative' do
        specify do
          a = described_class.new(-10)
          b = a.sgn
          expect(b).to eq BasicInteger.new(-1)
        end
      end

      context 'when zero' do
        specify do
          a = described_class.new(00)
          b = a.sgn
          expect(b).to eq BasicInteger.new(0)
        end
      end

      context 'when positive' do
        specify do
          a = described_class.new(+10)
          b = a.sgn
          expect(b).to eq BasicInteger.new(+1)
        end
      end

    end

  end

end

RSpec.configure do |config|
  config.include NumericHelpers
end
