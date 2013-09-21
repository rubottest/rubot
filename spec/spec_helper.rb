require 'simplecov'
SimpleCov.minimum_coverage 100
SimpleCov.refuse_coverage_drop
SimpleCov.start

require 'rubot/fixtures'

glob = File.expand_path(File.join(__FILE__, '..', 'fixtures', '*.rubot'))
Rubot::Fixtures.loader = Rubot::Fixtures::Loader.new(glob)
