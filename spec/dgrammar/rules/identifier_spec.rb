require 'spec_helper'

describe 'identifier' do
  let(:rule) { 'identifier' }
  let(:scope) { 'support.other.identifier.d' }

  describe 'foo' do
    it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    it { should be_parsed_as(scope).in_code('3' + subject).with_rule(rule) }
  end

  describe 'foo2' do
    it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
  end

  describe '_foo' do
    it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
  end

  describe 'öl' do
    it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
  end
end
