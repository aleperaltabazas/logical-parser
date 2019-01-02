require 'rspec'
require_relative '../lib/proposition'
require_relative '../lib/exception'

describe 'Proposition spec' do

  it 'Only p should be a Contingency' do
    prop = Proposition.new("p")
    prop.parse

    expect do
      prop.evaluate
    end.to raise_exception(Contingency)
  end

  it '(p and q) then p should be true' do
    prop = Proposition.new("(p && q) > p")
    prop.parse

    expect(prop.evaluate).to be_truthy
  end

  it 'p and !p should be false' do
    prop = Proposition.new("p && !p")
    prop.parse

    expect(prop.evaluate).to be_falsey
  end
end