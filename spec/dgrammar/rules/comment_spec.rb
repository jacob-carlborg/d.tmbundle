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
end
