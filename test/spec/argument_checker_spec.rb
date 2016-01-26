# frozen_string_literal: true

require_relative 'spec_helper'

module Basic101

  describe ArgumentChecker do

    subject {described_class.new(args, required_types, optional_types)}

    context 'when takes [string]' do

      let(:required_types) {[BasicString]}
      let(:optional_types) {[]}

      context 'when given [string]' do
        let(:args) {[BasicString.new('')]}
        specify do
          expect{subject.check}.to_not raise_error
        end
      end

      context 'when given []' do
        let(:args) {[]}
        specify do
         expect do
            subject.check
         end.to raise_error InvalidArgumentError,
          'Wrong number of arguments (0 instead of 1)'
        end
      end

      context 'when given [string, string]' do
        let(:args) {[BasicString.new(''), BasicString.new('')]}
        specify do
         expect do
            subject.check
         end.to raise_error InvalidArgumentError,
          'Wrong number of arguments (2 instead of 1)'
        end
      end

      context 'when given [integer]' do
        let(:args) {[BasicInteger.new('')]}
        specify do
          expect do
            subject.check
          end.to raise_error InvalidArgumentError,
          'Expected string but got integer'
        end
      end

    end

    context 'when takes [integer, integer?]' do

      let(:required_types) {[BasicInteger]}
      let(:optional_types) {[BasicInteger]}

      context 'when given [integer]' do
        let(:args) {[BasicInteger.new(0)]}
        specify do
         expect do
            subject.check
         end.to_not raise_error
        end
      end

      context 'when given [integer, integer]' do
        let(:args) {[BasicInteger.new(0), BasicInteger.new(0)]}
        specify do
          expect{subject.check}.to_not raise_error
        end
      end

      context 'when given []' do
        let(:args) {[]}
        specify do
         expect do
            subject.check
         end.to raise_error InvalidArgumentError,
          'Wrong number of arguments (0 instead of 1..2)'
        end
      end

      context 'when given [integer, integer, integer]' do
        let(:args) {3.times.map {BasicInteger.new(0)}}
        specify do
         expect do
            subject.check
         end.to raise_error InvalidArgumentError,
          'Wrong number of arguments (3 instead of 1..2)'
        end
      end

      context 'when given [integer]' do
        let(:args) {[BasicString.new('')]}
        specify do
          expect do
            subject.check
          end.to raise_error InvalidArgumentError,
          'Expected integer but got string'
        end
      end

      context 'when given [integer, string]' do
        let(:args) {[BasicString.new('')]}
        specify do
          expect do
            subject.check
          end.to raise_error InvalidArgumentError,
          'Expected integer but got string'
        end
      end

      context 'when given [string, string]' do
        let(:args) {[BasicString.new('')]}
        specify do
          expect do
            subject.check
          end.to raise_error InvalidArgumentError,
          'Expected integer but got string'
        end
      end

    end

  end

end
