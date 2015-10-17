trait :integer_literal do
  rule 'bin_prefix' do
    name 'support.other.bin-prefix.d'
    match /0(?:b|B)/
  end

  rule 'non_zero_digit' do
    name 'support.other.non-zero-digit.d'
    match '[123456789]'
  end

  rule 'decimal_digit' do
    name 'support.other.decimal-digit.d'
    match { `0` | non_zero_digit }
  end

  rule 'binary_digit' do
    name 'support.other.binary-digit.d'
    match /0|1/
  end
end
