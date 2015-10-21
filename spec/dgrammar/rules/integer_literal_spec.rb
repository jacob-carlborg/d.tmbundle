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

  describe 'decimal_integer' do
    let(:rule) { 'decimal_integer' }
    let(:scope) { 'support.other.decimal-integer.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '2' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '52738' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '527_38_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_52738' do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'binary_integer' do
    let(:rule) { 'binary_integer' }
    let(:scope) { 'constant.numeric.integer.binary.d' }

    describe '0b0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0b1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0b_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0b11010' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0b_11010' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0b_11_010_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0B0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0B1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0B_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0B11010' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0B_11010' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0B_11_010_' do
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

  describe 'decimal_digits_us' do
    let(:rule) { 'decimal_digits_us' }
    let(:scope) { 'support.other.decimal-digits-us.d' }

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

    describe '012_3456_789' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_45678_65678938_302_' do
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

  describe 'binary_digits_us' do
    let(:rule) { 'binary_digits_us' }
    let(:scope) { 'support.other.binary-digits-us.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '11010' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_11010' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_11_010_' do
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

  describe 'binary_digit_us' do
    let(:rule) { 'binary_digit_us' }
    let(:scope) { 'support.other.binary-digit-us.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_' do
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

  describe 'hex_digits' do
    let(:rule) { 'hex_digits' }
    let(:scope) { 'support.other.hex-digits.d' }

    describe '03948' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'afb' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'abcdef_ABCDEF_0123456789' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_92_bcd_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_digits_us' do
    let(:rule) { 'hex_digits_us' }
    let(:scope) { 'support.other.hex-digits-us.d' }

    describe '03948' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'afb' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'abcdef_ABCDEF_0123456789' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_92_bcd_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_digits_no_single_us' do
    let(:rule) { 'hex_digits_no_single_us' }
    let(:scope) { 'support.other.hex-digits-no-single-us.d' }

    describe '03948' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'afb' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'abcdef_ABCDEF_0123456789' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_92_bcd_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_digit' do
    let(:rule) { 'hex_digit' }
    let(:scope) { 'support.other.hex-digit.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '5' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'b' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'f' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'D' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'E' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_digit_us' do
    let(:rule) { 'hex_digit_us' }
    let(:scope) { 'support.other.hex-digit-us.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '1' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '5' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'b' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'f' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'D' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'E' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_letter' do
    let(:rule) { 'hex_letter' }
    let(:scope) { 'support.other.hex-letter.d' }

    describe 'a' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'b' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'c' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'd' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'e' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'f' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'A' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'B' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'C' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'D' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'E' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'F' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
