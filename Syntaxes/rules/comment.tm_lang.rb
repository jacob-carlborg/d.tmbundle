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
end
