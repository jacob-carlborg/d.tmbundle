require 'spec_helper'

describe 'float_literal' do
  describe 'hex_float' do
    let(:rule) { 'hex_float' }
    let(:scope) { 'constant.numeric.float.hex.d' }

    describe '0xaf_ABF_0189.0_92_bcd_p283' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0X.0_92_bcd_p28' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0xaf_ABF_0189P+298' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_prefix' do
    let(:rule) { 'hex_prefix' }
    let(:scope) { 'support.other.hex-prefix.d' }

    describe '0x' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0X' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_exponent' do
    let(:rule) { 'hex_exponent' }
    let(:scope) { 'support.other.hex-exponent.d' }

    describe 'p+012_3456_789' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'P-_1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'p0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_exponent_start' do
    let(:rule) { 'hex_exponent_start' }
    let(:scope) { 'support.other.hex-exponent-start.d' }

    describe 'p' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'P' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'p+' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'P+' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'p-' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'P-' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'suffix' do
    let(:rule) { 'suffix' }
    let(:scope) { 'support.other.suffix.d' }

    describe 'f' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'F' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'L' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'i' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'fi' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Fi' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Li' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'float_suffix' do
    let(:rule) { 'float_suffix' }
    let(:scope) { 'support.other.float-suffix.d' }

    describe 'f' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'F' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a' do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'real_suffix' do
    let(:rule) { 'real_suffix' }
    let(:scope) { 'support.other.real-suffix.d' }

    describe 'L' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a' do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'imaginary_suffix' do
    let(:rule) { 'imaginary_suffix' }
    let(:scope) { 'support.other.imaginary-suffix.d' }

    describe 'i' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a' do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

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
