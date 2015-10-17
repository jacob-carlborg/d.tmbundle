require 'spec_helper'

describe 'integer_literal' do
  describe 'non_zero_digit' do
    let(:rule) { 'non_zero_digit' }
    let(:scope) { 'support.other.non-zero-digit.d' }

    describe '1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '2' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '3' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '4' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '5' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '6' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '7' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '8' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '9' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0' do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'decimal_digit' do
    let(:rule) { 'decimal_digit' }
    let(:scope) { 'support.other.decimal-digit.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '5' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'binary_digit' do
    let(:rule) { 'binary_digit' }
    let(:scope) { 'support.other.binary-digit.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '5' do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
