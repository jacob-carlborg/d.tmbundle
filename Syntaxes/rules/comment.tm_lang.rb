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
end
