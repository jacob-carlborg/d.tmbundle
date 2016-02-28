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
end
