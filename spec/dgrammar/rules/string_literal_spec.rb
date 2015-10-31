require 'spec_helper'

describe 'string_literal' do
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
