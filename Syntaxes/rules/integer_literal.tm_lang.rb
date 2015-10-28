trait :integer_literal do
  rule 'integer_literal' do
    name 'constant.numeric.integer.d'
    match { integer + optional(integer_suffix) }
  end

  rule 'integer' do
    name 'support.other.integer.d'
    match { binary_integer | hexadecimal_integer | decimal_integer }
  end

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

  rule 'hexadecimal_integer' do
    name 'constant.numeric.integer.hexadecimal.d'
    match { hex_prefix + hex_digits_no_single_us }
  end

  rule 'non_zero_digit' do
    name 'support.other.non-zero-digit.d'
    match '[123456789]'
  end

  rule 'decimal_digits_no_single_us' do
    name 'support.other.decimal-digits-no-single-us.d'
    match do
        decimal_digit + decimal_digits_us |
          decimal_digits_us + decimal_digit |
          decimal_digit
    end
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

  rule 'hex_prefix' do
    name 'support.other.hex-prefix.d'
    match /0(?:x|X)/
  end

  rule 'hex_digits' do
    name 'support.other.hex-digits.d'
    match { one_or_more(hex_digit) }
  end

  rule 'hex_digits_us' do
    name 'support.other.hex-digits-us.d'
    match { one_or_more(hex_digits) }
  end

  rule 'hex_digits_no_single_us' do
    name 'support.other.hex-digits-no-single-us.d'
    match { hex_digits_us }
  end

  rule 'hex_digit' do
    name 'support.other.hex-digit.d'
    match { decimal_digit | hex_letter }
  end

  rule 'hex_digit_us' do
    name 'support.other.hex-digit-us.d'
    match { hex_digit }
  end

  rule 'hex_letter' do
    name 'support.other.hex-letter.d'
    match /[abcdefABCDEF_]/
  end
end
