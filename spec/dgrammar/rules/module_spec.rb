require 'spec_helper'

describe 'module' do
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
