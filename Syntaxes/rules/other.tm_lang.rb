trait :other do
  rule 'white_space' do
    name 'support.other.white-space.d'
    match { one_or_more(space) }
  end

  rule 'space' do
    name 'support.other.space.d'
    match '[\x{0020}\x{0009}]'
  end
end
