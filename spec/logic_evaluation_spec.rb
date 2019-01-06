require 'rspec'
require_relative '../lib/logic_analyzer/logic_evaluation'
require_relative '../lib/logic_analyzer/logical_context'
require_relative '../lib/logic_analyzer/boolean'

describe 'Logic Evaluation spec' do
  it 'p and q should be false' do
    context = LogicalContext.new
    context.define_premise(:p, true)
    context.define_premise(:q, false)

    expect(context.truth_value("p && q")).to be_falsey
  end

  it 'p xor (q and r) should be true' do
    context = LogicalContext.new
    context.define_premise(:p, true)
    context.define_premise(:q, true)
    context.define_premise(:r, true)

    expect(context.truth_value("p != (q && r)")).to be_falsey
  end
end