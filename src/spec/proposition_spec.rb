require 'rspec'
require_relative '../lib/proposition'

describe 'Proposition spec' do

  it 'should do something' do
    prop = Proposition.new("p != (q && r)")
    prop.parse
  end
end