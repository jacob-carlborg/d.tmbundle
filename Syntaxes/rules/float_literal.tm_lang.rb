trait :float_literal do
  rule 'float_literal' do
    name 'constant.numeric.float.d'

    match do
      float + optional(suffix) |
      integer + imaginary_suffix |
      integer + float_suffix + imaginary_suffix |
      integer + real_suffix + imaginary_suffix
    end
  end

  rule 'float' do
    name 'support.other.float.d'
    match { decimal_float | hex_float }
  end

  rule 'decimal_float' do
    name 'support.other.decimal-float.d'

    match do
      decimal_digits + /\./ + decimal_digits_no_starting_us + decimal_exponent |
      leading_decimal + /\./ + optional(decimal_digits) |
      `\\.` + decimal_integer + optional(decimal_exponent) |
      leading_decimal + decimal_exponent
    end
  end

  rule 'decimal_exponent' do
    name 'support.other.decimal-exponent.d'
    match { decimal_exponent_start + decimal_digits_no_single_us }
  end

  rule 'decimal_exponent_start' do
    name 'support.other.decimal-exponent-start.d'
    match /[eE][+-]?/
  end

  rule 'hex_float' do
    name 'constant.numeric.float.hex.d'

    match do
      hex_prefix + hex_digits_no_single_us + /\./ + hex_digits_no_starting_us +
        hex_exponent |

      hex_prefix + /\./ + hex_digits_no_starting_us + hex_exponent |
      hex_prefix + hex_digits_no_single_us + hex_exponent
    end
  end

  rule 'hex_prefix' do
    name 'support.other.hex-prefix.d'
    match /0[xX]/
  end

  rule 'hex_exponent' do
    name 'support.other.hex-exponent.d'
    match { hex_exponent_start + decimal_digits_no_single_us }
  end

  rule 'hex_exponent_start' do
    name 'support.other.hex-exponent-start.d'
    match /[pP][+-]?/
  end

  rule 'suffix' do
    name 'support.other.suffix.d'
    match do
      float_suffix + imaginary_suffix |
      real_suffix + imaginary_suffix |
      float_suffix | real_suffix | imaginary_suffix
    end
  end

  rule 'float_suffix' do
    name 'support.other.float-suffix.d'
    match /f|F/
  end

  rule 'real_suffix' do
    name 'support.other.real-suffix.d'
    match /L/
  end

  rule 'imaginary_suffix' do
    name 'support.other.imaginary-suffix.d'
    match /i/
  end

  rule 'leading_decimal' do
    name 'support.other.leading-decimal.d'
    match { `0` + decimal_digits_no_single_us | decimal_integer }
  end
end
