require 'spec_helper'
require 'rubot/state'

shared_examples "a robot command" do |start, action, finish|

  let(:state) { Rubot::State.new(*start) }
  let(:expected_state) { Rubot::State.new(*finish) }

  it "Transitions from #{start} to #{finish} via #{action}" do
    new_state = state.send(action)
    new_state.should == expected_state
  end

end

describe Rubot::State do

  start = [0,0,:north]
  it_should_behave_like "a robot command", start, :left, [0,0,:west]
  it_should_behave_like "a robot command", start, :right, [0,0,:east]
  it_should_behave_like "a robot command", start, :move, [0,1,:north]

  start = [4,0,:south]
  it_should_behave_like "a robot command", start, :left, [4,0,:east]
  it_should_behave_like "a robot command", start, :right, [4,0,:west]
  it_should_behave_like "a robot command", start, :move, [4,0,:south]

  start = [2,3,:east]
  it_should_behave_like "a robot command", start, :left, [2,3,:north]
  it_should_behave_like "a robot command", start, :right, [2,3,:south]
  it_should_behave_like "a robot command", start, :move, [3,3,:east]

  start = [2,3,:west]
  it_should_behave_like "a robot command", start, :left, [2,3,:south]
  it_should_behave_like "a robot command", start, :right, [2,3,:north]
  it_should_behave_like "a robot command", start, :move, [1,3,:west]

end
