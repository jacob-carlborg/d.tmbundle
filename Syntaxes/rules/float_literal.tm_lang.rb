trait :float_literal do
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
