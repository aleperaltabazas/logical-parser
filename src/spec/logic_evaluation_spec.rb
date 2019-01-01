require 'rspec'
require_relative '../lib/logic_evaluation'
require_relative '../lib/logical_context'

describe 'Logic Evaluation spec' do
  it 'p and q should be false' do
    context = LogicalContext.new
    context.define_premise(:p, true)
    context.define_premise(:q, false)

    expect(context.truth_value("p and q")).to be_falsey
  end
end