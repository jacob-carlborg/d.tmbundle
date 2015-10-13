require 'tempfile'

require 'nokogiri'
require 'pry'

DMATE_ROOT = File.expand_path(File.dirname(__FILE__) + '/..')
$LOAD_PATH << File.join(DMATE_ROOT, 'Support/lib')
Dir[DMATE_ROOT + '/spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include DMate::Support::CodeToFile

  config.order = 'random'
  config.expect_with(:rspec) { |c| c.syntax = :should }
  config.mock_with(:rspec) { |c| c.syntax = :should }

  config.after :example do
    DMate::Support::TempFiles.clear
  end
end
