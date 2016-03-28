trait :expression do
  rule 'postfix_expression' do
    name 'support.other.postfix-expression.d'
    match do
      base_postfix_expression + /\s*\.\s*/ + identifier |
      base_postfix_expression + /\s*\+\+/ |
      base_postfix_expression + /\s*--/ |
      base_postfix_expression
      # base_postfix_expression . template_instance |
      # base_postfix_expression . new_expression |
      # base_postfix_expression -- |
      # base_postfix_expression ( argument_listopt ) |
    end
  end

  rule 'base_postfix_expression' do
    name 'support.other.base-postfix-expression.d'
    match do
      primary_expression
      # type_ctors? + basic_type + ( argument_list? )
      # index_expression
      # slice_expression
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
