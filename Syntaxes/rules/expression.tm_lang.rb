trait :expression do
  rule 'postfix_expression' do
    name 'support.other.postfix-expression.d'
    match do
      base_postfix_expression + /\s*\.\s*/ + identifier |
      base_postfix_expression + /\s*\+\+/ |
      base_postfix_expression + /\s*--/ |
      base_postfix_expression
      # base_postfix_expression . template_instance | TODO
      # base_postfix_expression . new_expression | TODO
      # base_postfix_expression -- | TODO
      # base_postfix_expression ( argument_listopt ) | TODO
    end
  end

  rule 'base_postfix_expression' do
    name 'support.other.base-postfix-expression.d'
    match do
      primary_expression
      # type_ctors? + basic_type + ( argument_list? ) TODO
      # index_expression TODO
      # slice_expression TODO
    end
  end

  rule 'primary_expression' do
    name 'support.other.primary-expression.d'

    match do
      keyword_variable |
      keyword_constant |
      `\\$` |
      float_literal |
      integer_literal |
      character_literal |
      # string_literals | TODO
      # array_literal | TODO
      # assoc_array_literal | TODO
      # function_literal | TODO
      # assert_expression | TODO
      # mixin_expression | TODO
      # import_expression | TODO
      # new_expression_with_args | TODO
      basic_type_x + /\s*\.\s*/ + identifier |
      typeof |
      # typeid_expression | TODO
      # is_expression | TODO
      # ( expression ) | TODO
      # traits_expression | TODO
      keyword_variable |
      keyword_constant |
      special_keyword |
      identifier |
      `.\\s*` + identifier
    end
  end
end
