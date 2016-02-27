require 'tempfile'

require 'active_support/core_ext/object/blank'
require 'nokogiri'
require 'pry'

require 'tm_grammar/rspec'

DMATE_ROOT = File.expand_path(File.dirname(__FILE__) + '/..')
$LOAD_PATH << File.join(DMATE_ROOT, 'Support/lib')
Dir[DMATE_ROOT + '/spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with(:rspec) { |c| c.syntax = :should }
  config.mock_with(:rspec) { |c| c.syntax = :should }

  config.before :suite do
    TmGrammar::RSpec::Matchers::BeParsedAs.grammar = 'Syntaxes/d.tm_lang.rb'
  end

  config.after :example do
    TmGrammar::RSpec::Util::TempFiles.clear
  end
end
