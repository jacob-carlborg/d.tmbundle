require 'spec_helper'

describe 'root' do
  let(:rule) { 'root' }

  describe 'module_declaration' do
    let(:scope) { 'meta.module.d' }

    describe 'module foo.bar;' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'import_declaration' do
    let(:scope) { 'meta.import.d' }

    describe 'import foo.bar;' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'string_literal' do
    let(:scope) { 'string.quoted.double.d' }

    describe '"foo"' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'character_literal' do
    let(:scope) { 'string.quoted.single.d' }

    describe "'a'" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'integer_literal' do
    let(:scope) { 'constant.numeric.integer.d' }

    describe '123' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'float_literal' do
    let(:scope) { 'constant.numeric.float.d' }

    describe '123.456' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'keyword' do
    let(:scope) { 'keyword.other.d' }

    describe 'return' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'operator' do
    let(:scope) { 'keyword.operator.d' }

    describe '==' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
