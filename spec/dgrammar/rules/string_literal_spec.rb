require 'spec_helper'

describe 'string_literal' do
  describe 'hex_string' do
    let(:rule) { 'hex_string' }
    let(:scope) { 'string.quoted.double.hex.d' }

    describe 'x"0273Eec  a29CD1 92 "' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'x"0"c' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'x"0abc20 382 c"w' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'x"0abc20\n382"' do
      subject { %(x"0abc20\n382 foobar") }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'x' do
      let(:code) { 'x"' }
      let(:scope) { 'storage.type.string.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe '"' do
      let(:code) { 'x"' }
      let(:scope) { 'punctuation.definition.string.begin.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe '"' do
      let(:code) { 'x"ad2"' }
      let(:scope) { 'punctuation.definition.string.end.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe 's' do
      let(:code) { 'x"12sad"' }
      let(:scope) { 'invalid.illegal.not-a-hex-character.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe 'k=' do
      let(:code) { 'x"k=2"' }
      let(:scope) { 'invalid.illegal.not-a-hex-character.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end
  end

  describe 'hex_string_chars' do
    let(:rule) { 'hex_string_chars' }
    let(:scope) { 'support.other.hex-string-chars.d' }

    describe '0273Eec  a29CD1 92 ' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '3ad' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'C' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\u0020\u0020' do
      subject { "\u0020\u0020" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_string_char' do
    let(:rule) { 'hex_string_char' }
    let(:scope) { 'support.other.hex-string-char.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '3' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'e' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'C' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\u0020\u0020' do
      subject { "\u0020\u0020" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'string_postfix' do
    let(:rule) { 'string_postfix' }
    let(:scope) { 'support.other.string-postfix.d' }

    describe 'c' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'w' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'd' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
