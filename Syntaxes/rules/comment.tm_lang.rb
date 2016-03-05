trait :comment do
  rule 'block_comment' do
    name 'comment.block.d'

    self.begin '/\*'
    self.end '\*/'

    begin_capture 0, 'punctuation.definition.comment.begin.d'
    end_capture 0, 'punctuation.definition.comment.end.d'
  end

  rule 'documentation_block_comment' do
    name 'comment.block.documentation.d'

    self.begin '/\*\*'
    self.end '\*/'

    begin_capture 0, 'punctuation.definition.comment.begin.d'
    end_capture 0, 'punctuation.definition.comment.end.d'

    pattern { include '#ddoc' }
  end

  rule 'line_comment' do
    name 'comment.line.double-slash.d'

    self.begin '(^[ \t]+)?(?=//)'
    self.end '(?!\G)'

    begin_capture 1, 'punctuation.whitespace.comment.leading.d'

    pattern 'comment.line.double-slash.d' do
      self.begin '//'
      self.end '\n'

      begin_capture 0, 'punctuation.definition.comment.d'
    end
  end

  rule 'documentation_line_comment' do
    name 'comment.line.tripple-slash.documentation.d'

    self.begin '(^[ \t]+)?(?=///)'
    self.end '(?!\G)'

    begin_capture 1, 'punctuation.whitespace.comment.leading.d'

    pattern 'comment.line.tripple-slash.d' do
      self.begin '///'
      self.end '\n'

      begin_capture 0, 'punctuation.definition.comment.d'
    end
  end

  rule 'nesting_block_comment' do
    name 'comment.block.nesting.d'

    self.begin '/\+'
    self.end '\+/'

    begin_capture 0, 'punctuation.definition.comment.begin.d'
    end_capture 0, 'punctuation.definition.comment.end.d'

    pattern { include '#nesting_block_comment' }
  end

  rule 'documentation_nesting_block_comment' do
    name 'comment.block.documentation.nesting.d'

    self.begin '/\+\+'
    self.end '\+/'

    begin_capture 0, 'punctuation.definition.comment.begin.d'
    end_capture 0, 'punctuation.definition.comment.end.d'

    pattern { include '#documentation_nesting_block_comment' }
    pattern { include '#ddoc' }
  end

  rule 'ddoc' do
    pattern { include '#ddoc_standard_sections' }
    pattern { include '#ddoc_standard_section_escapes' }
    pattern { include '#ddoc_embedded_code' }
    pattern { include '#ddoc_inline_code' }
    pattern { include '#ddoc_predefined_macros' }
  end

  rule 'ddoc_standard_sections' do
    STANDARD_SECTIONS = %w(
      Authors Bugs Date Deprecated Examples History License Returns See_Also
      Standards Throws Version Copyright Params Macros
    ).join('|').freeze

    match '(?:^[ \t]*(?:\*|\+)?[ \t]+)?' + "(\\b(?:#{STANDARD_SECTIONS})\\b:)"
    capture 1, 'keyword.other.standard-section.ddoc.d'
  end

  rule 'ddoc_standard_section_escapes' do
    match '(?:^[ \t]*(?:\*|\+)?[ \t]+)?(\b(?:Escapes)\b[ \t]*=)'
    capture 1, 'keyword.other.standard-section.ddoc.d'
  end

  rule 'ddoc_embedded_code' do
    name 'support.other.embedded-code.ddoc.d'

    self.begin '---'
    self.end '---'

    pattern { include '$self' }
  end

  rule 'ddoc_inline_code' do
    name 'support.other.inline-code.ddoc.d'
    match '`([^`]*)`'

    capture 1 do
      pattern { include '$self' }
    end
  end

  rule 'ddoc_predefined_macros' do
    pattern { include '#ddoc_predefined_macro_b' }
    pattern { include '#ddoc_predefined_macro_i' }
    pattern { include '#ddoc_predefined_macro_u' }
    pattern { include '#ddoc_predefined_macro_li' }
    pattern { include '#ddoc_predefined_macro_d_code' }
    pattern { include '#ddoc_predefined_macro_d_inline_code' }
  end

  rule 'ddoc_predefined_macro_b' do
    name 'markup.bold.predefined-macro-b.ddoc.d'

    self.begin '\$\(B '
    self.end '\)'
  end

  rule 'ddoc_predefined_macro_i' do
    name 'markup.italic.predefined-macro-i.ddoc.d'

    self.begin '\$\(I '
    self.end '\)'
  end

  rule 'ddoc_predefined_macro_u' do
    name 'markup.underline.predefined-macro-u.ddoc.d'

    self.begin '\$\(U '
    self.end '\)'
  end

  rule 'ddoc_predefined_macro_li' do
    name 'markup.list.predefined-macro-li.ddoc.d'

    self.begin '\$\(LI '
    self.end '\)'
  end

  rule 'ddoc_predefined_macro_d_code' do
    name 'support.other.predefined-macro.d-code.ddoc.d'

    self.begin '\$\(D_CODE '
    self.end '\)'

    pattern { include '$self' }
  end

  rule 'ddoc_predefined_macro_d_inline_code' do
    name 'support.other.predefined-macro.d-inline-code.ddoc.d'

    self.begin '\$\(D_INLINECODE '
    self.end '\)'

    pattern { include '$self' }
  end
end
