require 'spec_helper'

describe 'string_literal' do
  describe 'double_quoted_characters' do
    let(:rule) { 'double_quoted_characters' }
    let(:scope) { 'support.other.double-quoted-characters.d' }

    describe 'acasbe' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'when the characters are escape sequences' do
      let(:scope) { 'constant.character.escape.d' }
      let(:code) { '\v\UC135a603' }

      describe '\v' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe '\UC135a603' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end

    context 'when the character are mixed letters an escape sequence' do
      let(:code) { 'foo\vbar\UC135a603asd' }
      let(:scope) { 'support.other.double-quoted-character.d' }

      describe 'foo' do
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe '\v' do
        let(:scope) { 'constant.character.escape.d' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'bar' do
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe '\UC135a603' do
        let(:scope) { 'constant.character.escape.d' }
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end

      describe 'asd' do
        it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
      end
    end
  end

  describe 'double_quoted_character' do
    let(:rule) { 'double_quoted_character' }
    let(:scope) { 'support.other.double-quoted-character.d' }

    describe 'a' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    context 'when the character is an escape sequence' do
      let(:scope) { 'constant.character.escape.d' }

      describe '\v' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end

      describe '\UC135a603' do
        it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
      end
    end
  end

  describe 'escape_sequence' do
    let(:rule) { 'escape_sequence' }
    let(:scope) { 'constant.character.escape.d' }

    describe "\\'" do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\"' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\?' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\\\\' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\a' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\b' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\f' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\n' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\r' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\t' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\v' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\xA2' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\5' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\16' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\203' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\u2603' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\uc704' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\UB704a603' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\&foobar;' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_string' do
    let(:rule) { 'hex_string' }
    let(:scope) { 'string.quoted.double.hex.d' }

    describe 'x"0273Eec  a29CD1 92 "' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'x"0"c' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'x"0abc20 382 c"w' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'x"0abc20\n382"' do
      subject { %(x"0abc20\n382 foobar") }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'x' do
      let(:code) { 'x"' }
      let(:scope) { 'storage.type.string.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe '"' do
      let(:code) { 'x"' }
      let(:scope) { 'punctuation.definition.string.begin.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe '"' do
      let(:code) { 'x"ad2"' }
      let(:scope) { 'punctuation.definition.string.end.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe 's' do
      let(:code) { 'x"12sad"' }
      let(:scope) { 'invalid.illegal.not-a-hex-character.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end

    describe 'k=' do
      let(:code) { 'x"k=2"' }
      let(:scope) { 'invalid.illegal.not-a-hex-character.d' }

      it { should be_parsed_as(scope).in_code(code).with_rule(rule) }
    end
  end

  describe 'hex_string_chars' do
    let(:rule) { 'hex_string_chars' }
    let(:scope) { 'support.other.hex-string-chars.d' }

    describe '0273Eec  a29CD1 92 ' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '3ad' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'C' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\u0020\u0020' do
      subject { "\u0020\u0020" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'hex_string_char' do
    let(:rule) { 'hex_string_char' }
    let(:scope) { 'support.other.hex-string-char.d' }

    describe '0' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '3' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'e' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'C' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe '\u0020\u0020' do
      subject { "\u0020\u0020" }
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end

  describe 'string_postfix' do
    let(:rule) { 'string_postfix' }
    let(:scope) { 'support.other.string-postfix.d' }

    describe 'c' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'w' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end

    describe 'd' do
      it { should be_parsed_as(scope).in_code(subject).with_rule(rule) }
    end
  end
end
