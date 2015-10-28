import 'rules/integer_literal'
import 'rules/float_literal'

grammar 'source.d' do
  comment 'D language'
  file_types %w(d di)
  key_equivalent '^~D'
  name 'D'
  uuid 'D7C3A109-0466-4C28-9ECF-10753300FF46'
  first_line_match '^#!.*\bg?dmd\b.'

  rule 'identifier' do
    name 'support.other.identifier.d'
    match '[_\p{L}](?:[_\p{L}\d])*'
  end

  mixin :integer_literal
  mixin :float_literal
end
