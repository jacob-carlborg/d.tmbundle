trait :integer_literal do
  rule 'integer_suffix' do
    name 'support.other.integer-suffix.d'
    match /(?:Lu|LU|uL|UL|L|u|U)/
  end

  rule 'bin_prefix' do
    name 'support.other.bin-prefix.d'
    match /0(?:b|B)/
  end

  rule 'non_zero_digit' do
    name 'support.other.non-zero-digit.d'
    match '[123456789]'
  end

  rule 'decimal_digits' do
    name 'support.other.decimal-digits.d'
    match { decimal_digit + zero_or_more(decimal_digit) }
  end

  rule 'decimal_digit' do
    name 'support.other.decimal-digit.d'
    match { `0` | non_zero_digit }
  end

  rule 'decimal_digit_us' do
    name 'support.other.decimal-digit-us.d'
    match { decimal_digit | `_` }
  end

  rule 'binary_digit' do
    name 'support.other.binary-digit.d'
    match /0|1/
  end
end
