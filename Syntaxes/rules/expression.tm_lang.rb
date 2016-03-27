trait :expression do
  rule 'primary_expression' do
    name 'support.other.primary-expression.d'

    match do
      keyword_variable |
      keyword_constant |
      `\\$` |
      float_literal |
      integer_literal |
      character_literal |
      # string_literals |
      # array_literal |
      # assoc_array_literal |
      # function_literal |
      # assert_expression |
      # mixin_expression |
      # import_expression |
      # new_expression_with_args |
      basic_type_x + /\s*\.\s*/ + identifier |
      typeof |
      # typeid_expression |
      # is_expression |
      # ( expression ) |
      # traits_expression |
      keyword_variable |
      keyword_constant |
      special_keyword |
      identifier |
      `.\\s*` + identifier
    end
  end
end
