trait :expression do
  rule 'mul_expression' do
    name 'support.other.mul-expression.d'

    match do
      unary_expression + one_or_more(base_mul_expression) |
      unary_expression
    end
  end

  rule 'base_mul_expression' do
    name 'support.other.base-mul-expression.d'

    match do
      `\\s*\\*\\s*` + unary_expression |
      `\\s*/\\s*` + unary_expression |
      `\\s*%\\s*` + unary_expression |
      unary_expression
    end
  end

  rule 'unary_expression' do
    name 'support.other.unary-expression.d'
    match do
      `&\\s*` + one_or_more(base_unary_expression2) |
      `\\+\\+\\s*` + one_or_more(base_unary_expression2) |
      `--\\s*` + one_or_more(base_unary_expression2) |
      `\\*\\s*` + one_or_more(base_unary_expression2) |
      `-\\s*` + one_or_more(base_unary_expression2) |
      `\\+\\s*` + one_or_more(base_unary_expression2) |
      `\\!\\s*` + one_or_more(base_unary_expression2) |
      base_unary_expression + one_or_more(base_unary_expression2) |
      base_unary_expression
    end
  end

  rule 'base_unary_expression2' do
    name 'support.other.base-unary-expression2.d'
    match do
      base_unary_expression |
      `\\s*&\\s*` + base_unary_expression |
      `\\s*\\+\\+\\s*` + base_unary_expression |
      `\\s*--\\s*` + base_unary_expression |
      `\\s*\\*\\s*` + base_unary_expression |
      `\\s*-\\s*` + base_unary_expression |
      `\\s*\\+\\s*` + base_unary_expression |
      `\\s*\\!\\s*` + base_unary_expression
    end
  end

  rule 'base_unary_expression' do
    name 'support.other.base-unary-expression.d'
    match do
      # complement_expression TODO
      # ( type ) . identifier TODO
      # ( type ) . template_instance TODO
      # delete_expression TODO
      # cast_expression TODO
      pow_expression
    end
  end

  rule 'pow_expression' do
    name 'support.other.pow-expression.d'
    match do
      postfix_expression
      # postfix_expression ^^ unary_expression TODO
    end
  end

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
