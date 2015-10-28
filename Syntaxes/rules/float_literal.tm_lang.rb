trait :float_literal do
  rule 'leading_decimal' do
    name 'support.other.leading-decimal.d'
    match { `0` + decimal_digits_no_single_us | decimal_integer }
  end
end
