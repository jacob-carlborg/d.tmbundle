trait :integer_literal do
  rule 'integer_suffix' do
    name 'support.other.integer-suffix.d'
    match /(?:Lu|LU|uL|UL|L|u|U)/
  end

  rule 'decimal_integer' do
    name 'support.other.decimal-integer.d'
    match { `0` | non_zero_digit + optional(decimal_digits_us) }
  end

  rule 'binary_integer' do
    name 'constant.numeric.integer.binary.d'
    match { bin_prefix + binary_digits_us }
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

  rule 'decimal_digits_us' do
    name 'support.other.decimal-digits-us.d'
    match { decimal_digit_us + zero_or_more(decimal_digit_us) }
  end

  rule 'decimal_digit' do
    name 'support.other.decimal-digit.d'
    match { `0` | non_zero_digit }
  end

  rule 'decimal_digit_us' do
    name 'support.other.decimal-digit-us.d'
    match { decimal_digit | `_` }
  end

  rule 'binary_digits_us' do
    name 'support.other.binary-digits-us.d'
    match { binary_digit_us + zero_or_more(binary_digit_us) }
  end

  rule 'binary_digit' do
    name 'support.other.binary-digit.d'
    match /0|1/
  end

  rule 'binary_digit_us' do
    name 'support.other.binary-digit-us.d'
    match { binary_digit | `_` }
  end
end
