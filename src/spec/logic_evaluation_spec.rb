require 'rspec'
require_relative '../lib/logic_evaluation'

describe 'Logic Evaluation spec' do
  it 'p and q should be false' do
    p = true
    q = false

    expect("p and q".logic_value).to be_falsey
  end
end