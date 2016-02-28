trait :comment do
  rule 'block_comment' do
    name 'comment.block.d'

    self.begin '/\*'
    self.end '\*/'

    begin_capture 0, 'punctuation.definition.comment.begin.d'
    end_capture 0, 'punctuation.definition.comment.end.d'
  end
end
