require 'spec_helper'

describe 'type' do
  describe 'basic_type_x' do
    let(:rule) { 'basic_type_x' }
    let(:scope) { 'storage.type.basic.d' }

    describe 'bool' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'byte' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'ubyte' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'short' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'ushort' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'int' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'uint' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'long' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'ulong' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'char' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'wchar' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'dchar' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'float' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'double' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'real' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'ifloat' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'idouble' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'ireal' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'cfloat' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'cdouble' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'creal' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'void' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
