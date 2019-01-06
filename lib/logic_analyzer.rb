require_relative 'logic_analyzer/boolean'
require_relative 'logic_analyzer/exception'
require_relative 'logic_analyzer/logical_context'
require_relative 'logic_analyzer/proposition'
require_relative 'logic_analyzer/truth_table'

class LogicAnalyzer
  attr_accessor :sentences, :conclusion, :proposition

  def initialize(*args)
    self.sentences = []

    unless args.empty?
      args.each do |sentence|
        sentences.append("(#{sentence})")
      end
    end
  end

  def add_sentence(sentence)
    sentences.append("(#{sentence})")
  end

  def add_conclusion(conclusion)
    self.conclusion = "(#{conclusion})"
  end

  def evaluate
    parse

    prop = Proposition.new(proposition)
    prop.parse

    prop.evaluate
  end

  def parse
    if sentences.empty?
      raise ArgumentError 'Cannot evaluate with no propositions'
    elsif sentences.size == 1
      self.proposition = sentences[0]
    else
      self.proposition = if conclusion.nil?
                           sentences.join(' and ')
                         else
                           "(#{sentences.join(' and ')}) then #{conclusion}"
                         end
    end
  end
end
