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

  describe 'ddoc_inline_code' do
    let(:rule) { 'ddoc_inline_code' }
    let(:scope) { 'support.other.inline-code.ddoc.d' }

    describe '`foo`' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "`foo\nbar`" do
      it { should_not be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'ddoc_predefined_macros' do
    context 'B macro' do
      let(:rule) { 'ddoc_predefined_macros' }
      let(:scope) { 'markup.bold.predefined-macro-b.ddoc.d' }

      describe '$(B foo)' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'I macro' do
      let(:rule) { 'ddoc_predefined_macros' }
      let(:scope) { 'markup.italic.predefined-macro-i.ddoc.d' }

      describe '$(I foo)' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'U macro' do
      let(:rule) { 'ddoc_predefined_macros' }
      let(:scope) { 'markup.underline.predefined-macro-u.ddoc.d' }

      describe '$(U foo)' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'LI macro' do
      let(:rule) { 'ddoc_predefined_macros' }
      let(:scope) { 'markup.list.predefined-macro-li.ddoc.d' }

      describe '$(LI foo)' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'D_CODE macro' do
      let(:rule) { 'ddoc_predefined_macros' }
      let(:scope) { 'support.other.predefined-macro.d-code.ddoc.d' }

      describe '$(D_CODE foo)' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'D_INLINECODE macro' do
      let(:rule) { 'ddoc_predefined_macros' }
      let(:scope) { 'support.other.predefined-macro.d-inline-code.ddoc.d' }

      describe '$(D_INLINECODE foo)' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end
  end

  describe 'ddoc_predefined_macro_b' do
    let(:rule) { 'ddoc_predefined_macro_b' }
    let(:scope) { 'markup.bold.predefined-macro-b.ddoc.d' }

    describe '$(B foo)' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "$(B foo\nbar)" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'ddoc_predefined_macro_i' do
    let(:rule) { 'ddoc_predefined_macro_i' }
    let(:scope) { 'markup.italic.predefined-macro-i.ddoc.d' }

    describe '$(I foo)' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "$(I foo\nbar)" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'ddoc_predefined_macro_u' do
    let(:rule) { 'ddoc_predefined_macro_u' }
    let(:scope) { 'markup.underline.predefined-macro-u.ddoc.d' }

    describe '$(U foo)' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "$(U foo\nbar)" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'ddoc_predefined_macro_li' do
    let(:rule) { 'ddoc_predefined_macro_li' }
    let(:scope) { 'markup.list.predefined-macro-li.ddoc.d' }

    describe '$(LI foo)' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "$(LI foo\nbar)" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'ddoc_predefined_macro_d_code' do
    let(:rule) { 'ddoc_predefined_macro_d_code' }
    let(:scope) { 'support.other.predefined-macro.d-code.ddoc.d' }

    describe '$(D_CODE foo)' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "$(D_CODE foo\nbar)" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'ddoc_predefined_macro_d_inline_code' do
    let(:rule) { 'ddoc_predefined_macro_d_inline_code' }
    let(:scope) { 'support.other.predefined-macro.d-inline-code.ddoc.d' }

    describe '$(D_INLINECODE foo)' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe "$(D_INLINECODE foo\nbar)" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end

