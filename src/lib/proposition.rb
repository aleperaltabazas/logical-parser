require_relative 'logical_context'
require_relative 'exception'
require_relative 'truth_table'

class Proposition
  attr_accessor :sentence, :variables

  def initialize(sentence)
    @sentence = syntax_sugars(sentence)

    @sentence.define_singleton_method(:words) do
      split(/\W+/)
    end

    @sentence.define_singleton_method(:operands) do
      split(/\s|\w|\s/).reject(&:empty?)
    end
  end

  def syntax_sugars(sentence)
    sentence.gsub(/and|&&/, '.and')
            .gsub(/or|\|/, '.or')
            .gsub(/then|>/, '.then')
            .gsub(/if_and_only_if|<=>/, '.if_and_only_if')
            .gsub(/xor|!=/, '.xor')
  end

  def parse
    @variables = sentence.words
  end

  def evaluate
    context = LogicalContext.new
    values = []
    table = TruthTable.new(variables)
    table.generate_table

    for iteration in 0...amount_of_variables
      variables.each do |var|
        context.define_premise(var, table.truth_value_of(var, iteration))
      end

      values.append(context.truth_value(sentence))
    end

    if values.include?(true) && values.include?(false)
      raise Contingency
    else
      values.send(:all?)
    end
  end

  def amount_of_variables
    2**variables.length
  end
end
