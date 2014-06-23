require 'tower_of_hanoi'

RSpec.configure do |config|
  # config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  #config.order = 'random'
  #config.raise_errors_for_deprecations!

  #hide deprication warnings
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
