require_relative 'spec_helper'

module Basic

  describe Output do

    let(:file) {StringIO.new}
    subject(:output) {described_class.new(file)}

    describe '#print' do

      context 'string' do
        specify do
          output.print 'abc'
          expect(file.string).to eq 'abc'
        end
      end

      context 'new line' do
        specify do
          output.print "\n"
          expect(file.string).to eq "\n"
        end
      end

      context 'tab' do

        specify do
          output.print "\tx"
          expect(file.string).to eq "              x"
        end

        specify do
          output.print "abcdefghijklm\tx"
          expect(file.string).to eq "abcdefghijklm x"
        end

        specify do
          output.print "abcdefghijklmn\tx"
          expect(file.string).to eq "abcdefghijklmn              x"
        end

      end

    end

    context '#tab_to' do

      context 'tab to following column' do
        specify do
          output.tab_to(4)
          output.print('x')
          expect(file.string).to eq '   x'
        end
      end

      context 'tab to current column' do
        specify do
          output.print('   ')
          output.tab_to(4)
          output.print('x')
          expect(file.string).to eq '   x'
        end
      end

      context 'tab to previous column' do
        specify do
          output.print('   x')
          output.tab_to(4)
          output.print('y')
          expect(file.string).to eq "   x\n   y"
        end
      end

      context 'tab to first column' do
        specify do
          output.tab_to(1)
          output.print('x')
          expect(file.string).to eq "x"
        end
      end

      context "tab to zero'th column" do
        specify do
          output.tab_to(0)
          output.print('x')
          expect(file.string).to eq "x"
        end
      end

    end

  end

end
