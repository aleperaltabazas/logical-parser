require 'rspec'
require_relative '../lib/boolean'

describe 'Boolean spec' do
  it 'true and false should be false' do
    p = true
    q = false

    expect(p.and(q)).to be_falsey
  end

  it 'true or false should be true' do
    p = true
    q = false

    expect(p.or(q)).to be_truthy
  end

  it 'true xor false should be true' do
    p = true
    q = false

    expect(p.xor(q)).to be_truthy
  end

  it 'true xor true should be false' do
    p = true
    q = true

    expect(p.xor(q)).to be_falsey
  end
end