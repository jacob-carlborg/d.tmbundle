require 'spec_helper'

describe 'string_literal' do
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
