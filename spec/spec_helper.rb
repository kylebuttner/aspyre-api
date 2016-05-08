require 'database_cleaner'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
  expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.backtrace_exclusion_patterns = [
   /\/lib\d*\/ruby\//,
   /bin\//,
   /gems/,
   /spec\/spec_helper\.rb/,
   /lib\/rspec\/(core|expectations|matchers|mocks)/
 ]

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
