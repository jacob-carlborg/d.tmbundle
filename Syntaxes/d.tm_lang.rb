import 'rules/root'

import 'rules/module'

import 'rules/comment'
import 'rules/integer_literal'
import 'rules/float_literal'
import 'rules/string_literal'
import 'rules/other'

grammar 'source.d' do
  comment 'D language'
  file_types %w(d di)
  key_equivalent '^~D'
  name 'D'
  uuid 'D7C3A109-0466-4C28-9ECF-10753300FF46'
  first_line_match '^#!.*\bg?dmd\b.'

  mixin :root

  # Parser
  mixin :module

  # Lexical
  mixin :comment
  mixin :integer_literal
  mixin :float_literal
  mixin :string_literal
  mixin :other
end
