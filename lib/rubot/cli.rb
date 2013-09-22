require 'rubot'

if ARGV.first == "-h"
  puts HELP_MESSAGE
  exit(0)
end

dsl = Rubot::Dsl.new
dsl.run(ARGF.read)
puts dsl.output
