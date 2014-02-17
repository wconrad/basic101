require_relative 'spec_helper'

module Basic

  describe ForStack do

    it 'should be empty' do
      expect(subject).to be_empty
    end

    it 'should not be empty' do
      statement1 = double(ForStatement, :reference => 'I')
      subject.push statement1
      expect(subject).to_not be_empty
    end

    it 'should act as a FIFO stack' do
      statement1 = double(ForStatement, :reference => 'I')
      statement2 = double(ForStatement, :reference => 'J')
      subject.push statement1
      subject.push statement2
      expect(subject.pop).to eq statement2
      expect(subject.pop).to eq statement1
      expect(subject).to be_empty
    end

    it 'should refuse to have the same reference duplicated' do
      statement1 = double(ForStatement, :reference => 'I')
      statement2 = double(ForStatement, :reference => 'I')
      subject.push statement1
      expect do
        subject.push statement2
      end.to raise_error DuplicateReferenceInForStack
    end

    it 'should peek at the top of the stack' do
      statement1 = double(ForStatement, :reference => 'I')
      statement2 = double(ForStatement, :reference => 'J')
      subject.push statement1
      subject.push statement2
      expect(subject.top).to eq statement2
      subject.pop
      expect(subject.top).to eq statement1
      subject.pop
      expect(subject.top).to be_nil      
    end

    it 'should delete entries with a reference variable' do
      statement1 = double(ForStatement, :reference => 'I')
      statement2 = double(ForStatement, :reference => 'J')
      subject.push statement1
      subject.push statement2
      subject.delete_reference('I')
      expect(subject.pop).to eq statement2
      expect(subject).to be_empty
    end

    it 'should locate the entry for a given reference variable' do
      statement1 = double(ForStatement, :reference => 'I')
      statement2 = double(ForStatement, :reference => 'J')
      subject.push statement1
      subject.push statement2
      expect(subject['I']).to eq statement1
      expect(subject['J']).to eq statement2
      expect(subject['K']).to be_nil
    end

  end

end
