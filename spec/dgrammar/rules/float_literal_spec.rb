require 'spec_helper'

describe 'float_literal' do
  describe 'leading_decimal' do
    let(:rule) { 'leading_decimal' }
    let(:scope) { 'support.other.leading-decimal.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '527_38_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_52738' do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '012_3456_789' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1_1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
