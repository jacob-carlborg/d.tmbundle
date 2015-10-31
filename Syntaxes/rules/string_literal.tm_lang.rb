trait :string_literal do
  rule 'string_postfix' do
    name 'support.other.string-postfix.d'
    match /[cwd]/
  end
end
