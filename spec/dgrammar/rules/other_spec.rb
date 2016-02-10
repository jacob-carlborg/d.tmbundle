require 'spec_helper'

describe 'other' do
  describe 'character' do
    let(:rule) { 'character' }
    let(:scope) { 'support.other.character.d' }

    describe 'a' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '2' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '☃' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

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

  describe 'identifier_start' do
    let(:rule) { 'identifier_start' }
    let(:scope) { 'support.other.identifier-start.d' }

    describe '_' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'a' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'ö' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'identifier_char' do
    let(:rule) { 'identifier_char' }
    let(:scope) { 'support.other.identifier-char.d' }

    describe 'a' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '5' do
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

  describe 'keyword' do
    let(:rule) { 'keyword' }

    context 'language variable' do
      let(:scope) { 'variable.language.d' }

      describe 'this' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe 'super' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'language constant' do
      let(:scope) { 'constant.language.d' }

      describe 'true' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe 'false' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe 'null' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'special keywords' do
      let(:scope) { 'constant.language.d' }

      describe '__FILE__' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe '__MODULE__' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe '__LINE__' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe '__FUNCTION__' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe '__PRETTY_FUNCTION__' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'control keywords' do
      let(:scope) { 'keyword.control.d' }

      describe 'if' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'type keywords' do
      let(:scope) { 'storage.type.d' }

      describe 'int' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'modifier keywords' do
      let(:scope) { 'storage.modifier.d' }

      describe 'final' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'other keywords' do
      let(:scope) { 'keyword.other.d' }

      describe 'return' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end
  end
end
