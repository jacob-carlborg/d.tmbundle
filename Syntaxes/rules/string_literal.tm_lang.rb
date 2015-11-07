trait :string_literal do
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
end
