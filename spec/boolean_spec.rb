require 'rspec'
require_relative '../lib/logical_analyzer/boolean'
require_relative '../lib/logical_analyzer/logic_evaluation'

describe 'Boolean spec' do
  it 'true and false should be false' do
    expect(true.and(false)).to be_falsey
  end

  it 'true or false should be true' do
    expect(true.or(false)).to be_truthy
  end

  it 'true or true should be true' do
    expect(true.or(true)).to be_truthy
  end

  it 'false or false should be false' do
    expect(false.or(false)).to be_falsey
  end

  it 'true xor false should be true' do
    expect(true.xor(false)).to be_truthy
  end

  it 'true xor true should be false' do
    expect(true.xor(true)).to be_falsey
  end

  it 'false xor false should be false' do
    expect(false.xor(false)).to be_falsey
  end

  it 'true then false should be false' do
    expect(true.then(false)).to be_falsey
  end

  it 'true then true should be true' do
    expect(true.then(true)).to be_truthy
  end

  it 'false then false should be true' do
    expect(false.then(true)).to be_truthy
  end

  it 'not true should be false' do
    expect(true.not).to be_falsey
  end

  it 'not false should be true' do
    expect(false.not).to be_truthy
  end

  it 'true if and only if false should be false' do
    expect(true.if_and_only_if(false)).to be_falsey
  end

  it 'true if and only if true should be true' do
    expect(true.if_and_only_if(true)).to be_truthy
  end

  it 'false if and only if false should be true' do
    expect(false.if_and_only_if(false)).to be_truthy
  end
end