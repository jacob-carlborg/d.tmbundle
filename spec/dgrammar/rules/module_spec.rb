require 'spec_helper'

describe 'module' do
  describe 'packages' do
    let(:rule) { 'packages' }
    let(:scope) { 'support.other.packages.d' }

    describe 'foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo.bar' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a.b.c.d' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'bar' do
      let(:scope) { 'support.other.package-name.d' }
      let(:code) { 'foo.bar' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end
  end

  describe 'package_name' do
    let(:rule) { 'package_name' }
    let(:scope) { 'support.other.package-name.d' }

    describe 'foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo' do
      let(:scope) { 'support.other.identifier.d' }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
