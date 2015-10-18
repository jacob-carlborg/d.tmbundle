require 'spec_helper'

describe 'integer_literal' do
  describe 'integer_suffix' do
    let(:rule) { 'integer_suffix' }
    let(:scope) { 'support.other.integer-suffix.d' }

    describe 'L' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'u' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'U' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Lu' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'LU' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'uL' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'UL' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'bin_prefix' do
    let(:rule) { 'bin_prefix' }
    let(:scope) { 'support.other.bin-prefix.d' }

    describe '0b' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0B' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

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

  describe 'decimal_digits' do
    let(:rule) { 'decimal_digits' }
    let(:scope) { 'support.other.decimal-digits.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '5' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0123456789' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '4567865678938302' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
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

  describe 'decimal_digit_us' do
    let(:rule) { 'decimal_digit_us' }
    let(:scope) { 'support.other.decimal-digit-us.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '5' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_' do
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
