require 'spec_helper'

describe 'other' do
  describe 'white_space' do
    let(:rule) { 'white_space' }
    let(:scope) { 'support.other.white-space.d' }

    describe '\u0020' do
      subject { "\u0020" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\u0009' do
      subject { "\u0009" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\u0020\u0009\u0020' do
      subject { "\u0020\u0009\u0020" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'space' do
    let(:rule) { 'space' }
    let(:scope) { 'support.other.space.d' }

    describe '\u0020' do
      subject { "\u0020" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\u0009' do
      subject { "\u0009" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'named_character_entity' do
    let(:rule) { 'named_character_entity' }
    let(:scope) { 'support.other.named-character-entity.d' }

    describe '&amp;' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '&ETH;' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '&öl;' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
