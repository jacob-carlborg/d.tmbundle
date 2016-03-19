trait :root do
  pattern { include '#root' }

  rule 'root' do
    # Grammar
    pattern { include '#module_declaration' }
    pattern { include '#import_declaration' }

    # Lexical
    pattern { include '#character_literal' }
    pattern { include '#string_literal' }
    pattern { include '#float_literal' }
    pattern { include '#integer_literal' }
    pattern { include '#keyword' }
    pattern { include '#operator' }
  end
end
