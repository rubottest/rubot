require 'spec_helper'
require 'rubot'

describe Rubot::Dsl do
  Rubot::Fixtures.each do |name, f|
    fixture = f
    it "executes sample #{name} correctly" do
      program = Rubot::Dsl.new
      program.run(fixture.instructions.join("\n"))
      program.output.should == fixture.expected
    end
  end
end
