trait :module do
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
