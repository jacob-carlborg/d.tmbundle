trait :string_literal do
  rule 'character_literal' do
    name 'string.quoted.single.d'
    match { `(?<begin>')` + single_quoted_character + `(?<end>')` }

    capture 'begin', 'punctuation.definition.string.begin.d'
    capture 'end', 'punctuation.definition.string.end.d'
  end

  rule 'single_quoted_character' do
    name 'support.other.single-quoted-character.d'
    match { escape_sequence | `[^']` }
  end

  rule 'string_literal' do
    pattern { include '#wysiwyg_string' }
    pattern { include '#alternate_wysiwyg_string' }
    pattern { include '#double_quoted_string' }
    pattern { include '#hex_string' }
    pattern { include '#delimited_string' }
    pattern { include '#token_string' }
  end

  rule 'wysiwyg_string' do
    name 'string.regexp.wysiwyg.d'

    self.begin 'r"'
    self.end { `"` + string_postfix? }

    begin_capture 0, 'punctuation.definition.string.begin.d'
    end_capture 0, 'punctuation.definition.string.end.d'

    pattern { include '#regular_expression' }
  end

  rule 'regular_expression' do
    pattern { include 'source.regexp.python' }
  end

  rule 'alternate_wysiwyg_string' do
    name 'string.quoted.other.alternate-wysiwyg.d'

    self.begin '`'
    self.end { `\`` + string_postfix? }

    begin_capture 0, 'punctuation.definition.string.begin.d'
    end_capture 0, 'punctuation.definition.string.end.d'
  end

  rule 'double_quoted_string' do
    name 'string.quoted.double.d'

    self.begin '"'
    self.end { `"` + string_postfix? }

    begin_capture 0, 'punctuation.definition.string.begin.d'
    end_capture 0, 'punctuation.definition.string.end.d'

    pattern { include '#double_quoted_characters' }
  end

  rule 'double_quoted_characters' do
    name 'support.other.double-quoted-characters.d'
    match { one_or_more(double_quoted_character) }
  end

  rule 'double_quoted_character' do
    name 'support.other.double-quoted-character.d'
    match { escape_sequence | character }
  end

  rule 'escape_sequence' do
    name 'constant.character.escape.d'
    match do
      `\\\\['"?\\\\0abfnrtv]` |
      `\\\\x` + hex_digit + hex_digit |
      `\\\\` + octal_digit + octal_digit + octal_digit |
      `\\\\` + octal_digit + octal_digit |
      `\\\\` + octal_digit |
      `\\\\u` + hex_digit + hex_digit + hex_digit + hex_digit |

      `\\\\U` + hex_digit + hex_digit + hex_digit + hex_digit +
                hex_digit + hex_digit + hex_digit + hex_digit |

      `\\\\` + named_character_entity
    end
  end

  rule 'hex_string' do
    name 'string.quoted.double.hex.d'

    self.begin '(x)(")'
    self.end '((?<=")(")|")(c|w|d)?'

    begin_capture 1, 'storage.type.string.d'
    begin_capture 2, 'punctuation.definition.string.begin.d'

    end_capture 1, 'punctuation.definition.string.end.d'
    end_capture 2, 'meta.empty-string.double.hex.multiline.d'

    pattern 'invalid.illegal.not-a-hex-character.d' do
      match /[^\h]+/
    end
  end

  rule 'hex_string_chars' do
    name 'support.other.hex-string-chars.d'
    match { one_or_more(hex_string_char) }
  end

  rule 'hex_string_char' do
    name 'support.other.hex-string-char.d'
    match { hex_digit | white_space }
  end

  rule 'string_postfix' do
    name 'support.other.string-postfix.d'
    match /[cwd]/
  end

  rule 'delimited_string' do
    name 'string.unquoted.delimited-string.d'

    self.begin '(q)"(.+)'
    self.end '(?!\G)\2"'

    begin_capture 1, 'punctuation.definition.string.begin.d'
    end_capture 0, 'punctuation.definition.string.end.d'
  end

  rule 'token_string' do
    name 'string.unquoted.token-string.d'

    self.begin '(q){'
    self.end '}'

    begin_capture 1, 'punctuation.definition.string.begin.d'
    end_capture 0, 'punctuation.definition.string.end.d'

    pattern { include '$self' }
  end
end
