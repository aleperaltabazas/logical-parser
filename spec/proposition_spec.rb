require 'rspec'
require_relative '../lib/logic_analyzer/proposition'
require_relative '../lib/logic_analyzer/exception'

describe 'Proposition spec' do

  it 'Only p should be a Contingency' do
    prop = Proposition.new('p')
    prop.parse

    expect do
      prop.evaluate
    end.to raise_exception(Contingency)
  end

  it '(p and q) then p should be true' do
    prop = Proposition.new('(p && q) > p')
    prop.parse

    expect(prop.evaluate).to be_truthy
  end

  it 'p and !p should be false' do
    prop = Proposition.new('p && !p')
    prop.parse

    expect(prop.evaluate).to be_falsey
  end

  it 'p and not p should be false' do
    prop = Proposition.new('p and not p')
    prop.parse

    expect(prop.evaluate).to be_falsey
  end

  it 'p <=> q and p xor q should be a contradiction' do
    prop = Proposition.new('(p only_if q) and (p xor q)')
    prop.parse

    expect(prop.evaluate).to be_falsey
  end
end