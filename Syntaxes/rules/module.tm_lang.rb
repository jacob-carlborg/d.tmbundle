trait :module do
  rule 'package_name' do
    name 'support.other.package-name.d'
    match { identifier }
  end
end
