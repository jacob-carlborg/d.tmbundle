trait :other do
  rule 'character' do
    name 'support.other.character.d'
    match /./
  end

  rule 'end_of_line' do
    name 'support.other.end-of-line.d'
    match /$/
  end

  rule 'white_space' do
    name 'support.other.white-space.d'
    match { one_or_more(space) }
  end

  rule 'space' do
    name 'support.other.space.d'
    match '[\x{0020}\x{0009}]'
  end

  rule 'named_character_entity' do
    name 'support.other.named-character-entity.d'
    match { `&` + identifier + `;` }
  end
end
