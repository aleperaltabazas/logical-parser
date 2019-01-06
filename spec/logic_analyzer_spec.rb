require 'rspec'
require_relative '../lib/logic_analyzer'

describe 'Logic Analyzer spec' do

  it 'Logic Analyzer with no args' do
    analyzer = LogicAnalyzer.new
    analyzer.add_sentence('p and !p')
    expect(analyzer.sentences[0]).to eq('(p and !p)')
    expect(analyzer.evaluate).to be_falsey
  end

  it 'Logic Analyzer with 1 arg' do
    analyzer = LogicAnalyzer.new('p and q')
    expect(analyzer.sentences[0]).to eq('(p and q)')
    expect do
      analyzer.evaluate
    end.to raise_exception(Contingency)
  end

  it 'Logic Analyser with 3 args' do
    analyzer = LogicAnalyzer.new('p and q', 'p then r', 'p')
    expect(analyzer.sentences).to eq(['(p and q)', '(p then r)', '(p)'])
    analyzer.parse
    expect(analyzer.proposition).to eq('(p and q) and (p then r) and (p)')
  end

  it 'Logic Analyzer with a conclusion' do
    analyzer = LogicAnalyzer.new('p and q', 'p')
    analyzer.add_conclusion('q')
    analyzer.parse
    expect(analyzer.proposition).to eq('((p and q) and (p)) then (q)')
    expect(analyzer.evaluate).to be_truthy
  end

end