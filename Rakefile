require 'bundler'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'cane/rake_task'

desc "Run cane to check quality metrics"
Cane::RakeTask.new(:quality) do |cane|
  cane.abc_max = 5
end

task :ci => [:quality, :spec]
