trait :root do
  pattern { include '#root' }

  rule 'root' do
    pattern { include '#module_declaration' }
  end
end
