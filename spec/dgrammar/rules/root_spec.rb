require 'spec_helper'

describe 'root' do
  let(:rule) { 'root' }

  describe 'module_declaration' do
    let(:scope) { 'meta.module.d' }

    describe 'module foo.bar;' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
