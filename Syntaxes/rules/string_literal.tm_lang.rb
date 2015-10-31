trait :string_literal do
  rule 'hex_string_char' do
    name 'support.other.hex-string-char.d'
    match { hex_digit | white_space }
  end

  rule 'string_postfix' do
    name 'support.other.string-postfix.d'
    match /[cwd]/
  end
end
