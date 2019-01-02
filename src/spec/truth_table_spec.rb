require 'rspec'
require_relative '../lib/truth_table'

describe 'Truth Table spec' do

  it 'Truth Table for 1 value should have only false and true' do
    table = TruthTable.new(Array.new(1))
    table.generate_table

    expect(table.table.size).to eq(2)
    expect(table.table[0][0]).to be_falsey
    expect(table.table[1][0]).to be_truthy
  end

  it 'Truth table for 3 elements' do
    table = TruthTable.new(Array.new(3))
    table.generate_table

    expect(table.table).to eq([[false, false, false],
                               [false, false, true],
                               [false, true, false],
                               [false, true, true],
                               [true, false, false],
                               [true, false, true],
                               [true, true, false],
                               [true, true, true]])
  end

  it 'Value for 12 should be ' do
    table = TruthTable.new(%w[foo bar])
    table.generate_table

    expect(table.truth_value_of('foo', 2)).to be_truthy
  end
end