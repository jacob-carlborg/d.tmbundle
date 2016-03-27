require 'spec_helper'

describe 'type' do
  describe 'type_ctors' do
    let(:rule) { 'type_ctors' }
    let(:scope) { 'support.other.type-ctors.d' }

    describe 'const' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'immutable const' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'type_ctor' do
      describe 'immutable' do
        let(:code) { 'immutable const' }
        let(:scope) { 'storage.modifier.type-constructor.d' }

        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end

  describe 'type_ctor' do
    let(:rule) { 'type_ctor' }
    let(:scope) { 'storage.modifier.type-constructor.d' }

    describe 'const' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'immutable' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'inout' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'shared' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

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

    describe 'typeof' do
      let(:rule) { 'typeof' }
      let(:scope) { 'meta.typeof.d' }
      let(:code) { 'typeof(return)' }

      describe 'typeof(return)' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe 'typeof ( return )' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe 'typeof' do
        let(:scope) { 'storage.modifier.typeof.d' }

        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'return' do
        let(:scope) { 'keyword.control.return.d' }

        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end
end
