# frozen_string_literal: true

require_relative 'spec_helper'

module Basic101

  describe Line do

    let(:line_number) {10}
    let(:statement1) {RemarkStatement.new}
    let(:statement2) {RemarkStatement.new}
    let(:statements) {[statement1, statement2]}
    subject!(:line) {Line.new(line_number, statements)}

    its(:line_number) {should eq line_number}
    its(:statements) {should eq statements}

  end

end
