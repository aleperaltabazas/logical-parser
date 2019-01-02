require 'rspec'
require_relative '../lib/proposition'

describe 'Proposition spec' do

  it 'should do something' do
    prop = Proposition.new("p.añbvasbas != (q && r)")
    prop.parse

    puts prop.variables
    expect(prop.variables.include?("p")).to be_falsey
  end
end