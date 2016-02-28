require 'spec_helper'

describe 'comment' do
  describe 'block_comment' do
    let(:rule) { 'block_comment' }
    let(:scope) { 'comment.block.d' }

    describe '/* foo */' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "/*\nfoo\n*/" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'documentation_block_comment' do
    let(:rule) { 'documentation_block_comment' }
    let(:scope) { 'comment.block.documentation.d' }

    describe '/** foo */' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "/**\nfoo\n*/" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'line_comment' do
    let(:rule) { 'line_comment' }
    let(:scope) { 'comment.line.double-slash.d' }

    describe '// foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "//foo" do
      let(:code) { 'bar//foo' }
      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end
  end

  describe 'documentation_line_comment' do
    let(:rule) { 'documentation_line_comment' }
    let(:scope) { 'comment.line.tripple-slash.documentation.d' }

    describe '/// foo' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "///foo" do
      let(:code) { 'bar///foo' }
      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end
  end

  describe 'nesting_block_comment' do
    let(:rule) { 'nesting_block_comment' }
    let(:scope) { 'comment.block.nesting.d' }

    describe '/+ foo +/' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "/+\nfoo\n+/" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'nesting comments' do
      describe "/+\nfoo /+\nbar\n+/ \n+/" do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end
  end

  describe 'documentation_nesting_block_comment' do
    let(:rule) { 'documentation_nesting_block_comment' }
    let(:scope) { 'comment.block.documentation.nesting.d' }

    describe '/++ foo +/' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "/++\nfoo\n+/" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'nesting comments' do
      describe "/++\nfoo /++\nbar\n+/ \n+/" do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end
  end

  describe 'ddoc_standard_sections' do
    let(:rule) { 'ddoc_standard_sections' }
    let(:scope) { 'keyword.other.standard-section.ddoc.d' }

    describe 'Authors:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Bugs:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Date:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Deprecated:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Examples:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'History:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'License:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Returns:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'See_Also:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Standards:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Throws:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Version:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Copyright:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Params:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'Macros:' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'with leading whitespace' do
      let(:code) { '    Authors:' }

      describe 'Authors:' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'with leading star' do
      let(:code) { '* Authors:' }

      describe 'Authors:' do
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end

    context 'with leading plus' do
      let(:code) { '+ Authors:' }

      describe 'Authors:' do
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end

  describe 'ddoc_standard_section_escapes' do
    let(:rule) { 'ddoc_standard_section_escapes' }
    let(:scope) { 'keyword.other.standard-section.ddoc.d' }

    describe 'Escapes=' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'with spaces before equals sign' do
      describe 'Escapes =' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'with leading whitespace' do
      let(:code) { '    Escapes=' }

      describe 'Escapes=' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'with leading star' do
      let(:code) { '* Escapes=' }

      describe 'Escapes=' do
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end

    context 'with leading plus' do
      let(:code) { '+ Escapes=' }

      describe 'Escapes=' do
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end

  describe 'ddoc_embedded_code' do
    let(:rule) { 'ddoc_embedded_code' }
    let(:scope) { 'support.other.embedded-code.ddoc.d' }

    describe "---\n---" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end

