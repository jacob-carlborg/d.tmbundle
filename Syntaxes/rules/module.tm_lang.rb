trait :module do
  rule 'module_declaration' do
    name 'meta.module.d'

    match do
      `^\\s*` +
        capture(:keyword, 'module') +
        /\s+/ +
        capture(:module_declaration_name, module_fully_qualified_name) +
        /\s*;/
    end

    capture :keyword, 'keyword.other.module.d'
    capture :module_declaration_name, 'entity.name.function.module.d'
  end

  rule 'module_fully_qualified_name' do
    name 'support.other.module-fully-qualified-name.d'
    match { packages + '\.' + module_name | module_name }
  end

  rule 'module_name' do
    name 'support.other.module-name.d'
    match { identifier }
  end

  rule 'packages' do
    name 'support.other.packages.d'
    match { package_name + zero_or_more(`\\.` + package_name) }
  end

  rule 'package_name' do
    name 'support.other.package-name.d'
    match { identifier }
  end
end
