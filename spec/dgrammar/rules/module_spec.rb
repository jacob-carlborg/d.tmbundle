require 'spec_helper'

describe 'module' do
  describe 'module_declaration' do
    let(:rule) { 'module_declaration' }
    let(:scope) { 'meta.module.d' }
    let(:code) { 'module foo.bar;' }

    describe 'module foo.bar;' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo.bar' do
      let(:scope) { 'entity.name.function.module.d' }
      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe 'foo.bar' do
      let(:scope) { 'support.other.module-fully-qualified-name.d' }
      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end
  end

  describe 'module_fully_qualified_name' do
    let(:rule) { 'module_fully_qualified_name' }
    let(:scope) { 'support.other.module-fully-qualified-name.d' }

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
      let(:scope) { 'support.other.module-name.d' }
      let(:code) { 'foo.bar' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end
  end

  describe 'module_name' do
    let(:rule) { 'module_name' }
    let(:scope) { 'support.other.module-name.d' }

    describe 'foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo' do
      let(:scope) { 'support.other.identifier.d' }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

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

  describe 'import' do
    let(:rule) { 'import' }
    let(:scope) { 'support.other.import.d' }

    describe 'foo.bar' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a = b.c' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'module_fully_qualified_name' do
      let(:scope) { 'support.other.module-fully-qualified-name.d' }

      describe 'foo.bar' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe 'b.c' do
        let(:code) { 'a = b.c' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end

    context 'module_alias_identifier' do
      let(:code) { 'a = b.c' }
      let(:scope) { 'support.other.module-alias-identifier.d' }

      describe 'a' do
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end

  describe 'import_bindings' do
    let(:rule) { 'import_bindings' }
    let(:scope) { 'support.other.import-bindings.d' }

    describe 'a.b : c' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a.b:c' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'import' do
      describe 'a.b' do
        let(:scope) { 'support.other.import.d' }
        let(:code) { 'a.b : c' }

        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end

    context 'import_bind_list' do
      describe 'c' do
        let(:scope) { 'support.other.import-bind-list.d' }
        let(:code) { 'a.b : c' }

        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end

  describe 'import_bind_list' do
    let(:rule) { 'import_bind_list' }
    let(:scope) { 'support.other.import-bind-list.d' }

    describe 'foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo = bar' do
      let(:scope) { 'support.other.import-bind.d' }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo,bar' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'bar , foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a, b, c, d' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a, b, c,' do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'import_bind' do
    let(:rule) { 'import_bind' }
    let(:scope) { 'support.other.import-bind.d' }

    describe 'foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo' do
      let(:scope) { 'support.other.identifier.d' }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'foo = bar' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'bar=foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'module_alias_identifier' do
    let(:rule) { 'module_alias_identifier' }
    let(:scope) { 'support.other.module-alias-identifier.d' }

    describe 'foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
