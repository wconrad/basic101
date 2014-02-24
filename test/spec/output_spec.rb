require_relative 'spec_helper'

module Basic101

  describe Output do

    let(:file) {StringIO.new}
    subject(:output) {described_class.new(file)}

    describe '#puts' do

      context 'with no string' do
        specify do
          output.puts
          expect(file.string).to eq "\n"
        end
      end

      context 'with string' do
        specify do
          output.puts "abc"
          expect(file.string).to eq "abc\n"
        end
      end

    end

    describe '#print' do

      context 'when string' do
        specify do
          output.print 'abc'
          expect(file.string).to eq 'abc'
        end
      end

      context 'when new line' do
        specify do
          output.print "\n"
          expect(file.string).to eq "\n"
        end
      end

      context 'when tab' do

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

    describe '#tab_to' do

      context 'when tab to following column' do
        specify do
          output.tab_to(3)
          output.print('x')
          expect(file.string).to eq '   x'
        end
      end

      context 'when tab to current column' do
        specify do
          output.print('   ')
          output.tab_to(3)
          output.print('x')
          expect(file.string).to eq '   x'
        end
      end

      context 'when tab to previous column' do
        specify do
          output.print('   x')
          output.tab_to(3)
          output.print('y')
          expect(file.string).to eq "   xy"
        end
      end

      context 'when tab to first column' do
        specify do
          output.tab_to(0)
          output.print('x')
          expect(file.string).to eq "x"
        end
      end

      context 'when tab to negative column' do
        specify do
          output.tab_to(-1)
          output.print('x')
          expect(file.string).to eq "x"
        end
      end

    end

    describe '#isatty' do

      before(:each) {file.stub(:isatty => file_isatty)}

      context 'when file is tty' do
        let(:file_isatty) {true}
        its(:isatty) {should be_true}
      end

      context 'when file is tty' do
        let(:file_isatty) {false}
        its(:isatty) {should be_false}
      end

    end

  end

end
